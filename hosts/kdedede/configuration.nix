# /hosts/kdedede/configuration.nix

{
  config,
  pkgs,
  inputs,
  ...
}:

{
  custom = {
    steam.enable = false;
    discord.enable = false;
    hyprland.enable = false;
    gui.enable = false;
    # zfs-dedede.enable = false;
  };

  # Bootloader.
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [ "zfs" ];
  networking.hostId = "78eace7a";
  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    mirroredBoots = [
      {
        devices = [
          "/dev/disk/by-id/nvme-KINGSTON-SNV2S1000G_50026B7686C1464-part1"
          "/dev/disk/by-id/nvme-KINGSTON-SNV2S1000G_50026B7686C138FE-part1"
        ];
        path = "/boot";
      }
    ];
    zfsSupport = true;
    device = "nodev";
  };

  boot.zfs.extraPools = [ "zpool" ];
  boot.zfs.requestEncryptionCredentials = true;
  boot.zfs.devNodes = "/dev/disk/by-id";

  swapDevices = [
    { device = "/dev/disk/by-id/nvme-KINGSTON-SNV2S1000G_50026B7686C138FE-part2"; }
    { device = "/dev/disk/by-id/nvme-KINGSTON-SNV2S1000G_50026B7686C138FE-part1"; }
  ];

  services.zfs = {
    autoScrub.enable = true;
    trim.enable = true;
  };

  networking.hostName = "kdedede"; # Define your hostname.

  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = false;

  # Enable zsh
  #  programs.zsh.enable = true;
  programs.fish.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Install firefox.
  programs.firefox.enable = false;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
