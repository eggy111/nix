#!/usr/bin/env bash

# Originally written by Iynaix, I have edited it (marginally) to work for my system lol
set -o errexit
set -o nounset
set -o pipefail

function yesno() {
        local prompt="$1"

        while true; do
                read -rp "$prompt [y/n] " yn
                case $yn in
                [Yy]*)
                        echo "y"
                        return
                        ;;
                [Nn]*)
                        echo "n"
                        return
                        ;;
                *) echo "Please answer yes or no." ;;
                esac
        done
}

cat <<Introduction
The *entire* disk will be formatted with a 1GB boot partition
(labelled NIXBOOT), 16GB of swap, and the rest allocated to ZFS.

The following ZFS datasets will be created:
    - zroot/root (mounted at / with blank snapshot)
    - zroot/nix (mounted at /nix)
    - zroot/tmp (mounted at /tmp)
    - zroot/persist (mounted at /persist)
    - zroot/cache (mounted at /cache)

** IMPORTANT **
This script assumes that the relevant "fileSystems" are declared within the
NixOS config to be installed. It does not create any hardware configuration
or modify the NixOS config to be installed in any way. If you have not done
so, you will need to add the necessary zfs options and filesystems before
proceeding or your install WILL NOT BOOT.

Introduction

# ZFS "fileSystems" declarations can be referenced from zfs.nix
# ZFS also requires the following options to be set within host config:
#   networking.hostId (can be generated using: head -c 8 /etc/machine-id)
#   zfs.devNodes
#       "/dev/disk/by-id" for Intel CPUs
#       "/dev/disk/by-partuuid" for AMD CPUs / within VMs
# impermanence setup can be referenced from impermanence.nix

# in a vm, special case
if [[ -b "/dev/vda" ]]; then
        DISK="/dev/vda"
else
        # listing with the standard lsblk to help with viewing partitions
        lsblk

        # Get the list of disks
        mapfile -t disks < <(lsblk -ndo NAME,SIZE,MODEL)

        echo -e "\nAvailable disks:\n"
        for i in "${!disks[@]}"; do
                printf "%d) %s\n" $((i + 1)) "${disks[i]}"
        done

        # Get user selection
        while true; do
                echo ""
                read -rp "Enter the number of the disk to install to: " selection
                if [[ "$selection" =~ ^[0-9]+$ ]] && [ "$selection" -ge 1 ] && [ "$selection" -le ${#disks[@]} ]; then
                        break
                else
                        echo "Invalid selection. Please try again."
                fi
        done

        # Get the selected disk
        DISK="/dev/$(echo "${disks[$selection - 1]}" | awk '{print $1}')"

        ###################################################################################################
        # PROMPT FOR MIRROR HERE
        ###################################################################################################

        # Get second user selection
        while true; do
                echo ""
                read -rp "Enter the number of the mirror disk to install to: " selection2
                if [[ "$selection2" =~ ^[0-9]+$ ]] && [ "$selection2" -ge 1 ] && [ "$selection2" -le ${#disks[@]} ]; then
                        break
                else
                        echo "Invalid selection. Please try again."
                fi
        done

        # Get the selected disk
        DISK2="/dev/$(echo "${disks[$selection2 - 1]}" | awk '{print $1}')"

fi

# if disk contains "nvme", append "p" to partitions
if [[ "$DISK" =~ "nvme" ]]; then
        BOOTDISK="${DISK}p3"
        SWAPDISK="${DISK}p2"
        ZFSDISK="${DISK}p1"
else
        BOOTDISK="${DISK}3"
        SWAPDISK="${DISK}2"
        ZFSDISK="${DISK}1"
fi

###################################################################################################
# SET MIRROR DISK VARIABLES HERE
###################################################################################################

# if disk contains "nvme", append "p" to partitions
if [[ "$DISK2" =~ "nvme" ]]; then
        BOOTDISK2="${DISK2}p3"
        SWAPDISK2="${DISK2}p2"
        ZFSDISK2="${DISK2}p1"
else
        BOOTDISK2="${DISK2}3"
        SWAPDISK2="${DISK2}2"
        ZFSDISK2="${DISK2}1"
fi

echo "Boot Partition: $BOOTDISK"
echo "Boot Partition2: $BOOTDISK2"
echo "SWAP Partition: $SWAPDISK"
echo "SWAP Partition2: $SWAPDISK2"
echo "ZFS Partition: $ZFSDISK"
echo "ZFS Partition2: $ZFSDISK2"

echo ""
do_format=$(yesno "This irreversibly formats the entire disk. Are you sure?")
if [[ $do_format == "n" ]]; then
        exit
fi

echo "Creating partitions"
sudo blkdiscard -f "$DISK"
sudo sgdisk --clear"$DISK"

sudo sgdisk -n3:1M:+1G -t3:EF00 "$DISK"
sudo sgdisk -n2:0:+16G -t2:8200 "$DISK"
sudo sgdisk -n1:0:0 -t1:BF01 "$DISK"

# notify kernel of partition changes
sudo sgdisk -p "$DISK" >/dev/null
sleep 5

echo "Creating Swap"
sudo mkswap "$SWAPDISK" --label "SWAP"
sudo swapon "$SWAPDISK"

echo "Creating Boot Disk"
sudo mkfs.fat -F 32 "$BOOTDISK" -n NIXBOOT

###################################################################################################
# SET MIRROR DISK PARTITIONS HERE
###################################################################################################

echo "Creating mirror partitions"
sudo blkdiscard -f "$DISK2"
sudo sgdisk --clear"$DISK2"

sudo sgdisk -n3:1M:+1G -t3:EF00 "$DISK2"
sudo sgdisk -n2:0:+16G -t2:8200 "$DISK2"
sudo sgdisk -n1:0:0 -t1:BF01 "$DISK2"

# notify kernel of partition changes
sudo sgdisk -p "$DISK2" >/dev/null
sleep 5

echo "Creating Swap"
sudo mkswap "$SWAPDISK2" --label "SWAP"
sudo swapon "$SWAPDISK2"

echo "Creating Boot Disk2"
sudo mkfs.fat -F 32 "$BOOTDISK2" -n NIXBOOT2

# setup encryption
use_encryption=$(yesno "Use encryption? (Encryption must also be enabled within host config with boot.zfs.requestEncryptionCredentials = true)")
if [[ $use_encryption == "y" ]]; then
        encryption_options=(-O encryption=aes-256-gcm -O keyformat=passphrase -O keylocation=prompt)
else
        encryption_options=()
fi

###################################################################################################
# ADD MIRROR TO POOL
###################################################################################################
echo "Creating base zpool"
sudo zpool create -f \
        -o ashift=12 \
        -o autotrim=on \
        -O compression=zstd \
        -O acltype=posixacl \
        -O atime=off \
        -O xattr=sa \
        -O normalization=formD \
        -O mountpoint=none \
        "${encryption_options[@]}" \
        zroot mirror \
        "$ZFSDISK" "$ZFSDISK2"

# NOTE: legacy mounts are used so they can be managed by fstab and swapped out via nixos configuration, e.g. for tmpfs
echo "Creating /"
sudo zfs create -o mountpoint=legacy zroot/root
sudo zfs snapshot zroot/root@blank
sudo mount -t zfs zroot/root /mnt

# create the boot parition after creating root
echo "Mounting /boot (efi)"
sudo mount --mkdir "$BOOTDISK" /mnt/boot

echo "Creating /nix"
sudo zfs create -o mountpoint=legacy zroot/nix
sudo mount --mkdir -t zfs zroot/nix /mnt/nix

echo "Creating /tmp"
sudo zfs create -o mountpoint=legacy zroot/tmp
sudo mount --mkdir -t zfs zroot/tmp /mnt/tmp

echo "Creating /cache"
sudo zfs create -o mountpoint=legacy zroot/cache
sudo mount --mkdir -t zfs zroot/cache /mnt/cache

# handle persist, possibly from snapshot
restore_snapshot=$(yesno "Do you want to restore from a persist snapshot?")
if [[ $restore_snapshot == "y" ]]; then
        echo "Enter full path to snapshot: "
        read -r snapshot_file_path
        echo

        echo "Creating /persist"
        # disable shellcheck (sudo doesn't affect redirects)
        # shellcheck disable=SC2024
        sudo zfs receive -o mountpoint=legacy zroot/persist <"$snapshot_file_path"

else
        echo "Creating /persist"
        sudo zfs create -o mountpoint=legacy zroot/persist
fi
sudo mount --mkdir -t zfs zroot/persist /mnt/persist

# get repo to install from
read -rp "Enter flake URL (default: github:eggy111/nix): " repo
repo="${repo:-github:eggy111/nix}"

# only relevant for EggOS
if [[ $repo == "github:eggy111/nix" ]]; then
        hosts=("desktop" "framework" "kdedede" "blade")

        echo "Available hosts:"
        for i in "${!hosts[@]}"; do
                printf "%d) %s\n" $((i + 1)) "${hosts[i]}"
        done

        while true; do
                echo ""
                read -rp "Enter the number of the host to install: " selection
                if [[ "$selection" =~ ^[0-9]+$ ]] && [ "$selection" -ge 1 ] && [ "$selection" -le ${#hosts[@]} ]; then
                        host="${hosts[$selection - 1]}"
                        break
                else
                        echo "Invalid selection. Please enter a number between 1 and ${#hosts[@]}."
                fi
        done
else
        # non IynaixOS, prompt for host
        read -rp "Which host to install?" host
fi

read -rp "Enter git rev for flake (default: main): " git_rev

echo "Installing NixOS"
if [[ $repo == "github:iynaix/dotfiles" ]]; then
        # root password is irrelevant if initialPassword is set in the config
        sudo nixos-install --no-root-password --flake "$repo/${git_rev:-main}#$host" --option tarball-ttl 0
else
        sudo nixos-install --flake "$repo/${git_rev:-main}#$host" --option tarball-ttl 0
fi

# only relevant for IynaixOS
if [[ $repo == "github:iynaix/dotfiles" ]]; then
        echo "To setup secrets, run \"install-remote-secrets\" on the other host."

        IP_ADDR=$(ifconfig | awk '/inet / && !/127.0.0.1/ {print $2; exit}')
        echo "The IP address of this host is $IP_ADDR"
fi

echo "Installation complete. It is now safe to reboot."
