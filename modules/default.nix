#default.nix
#barrel file for my modules
{ lib, inputs, ... }:
{
  imports = [
    ./users
    ./bluetooth.nix
    ./discord.nix
    ./fonts.nix
    ./framework.nix
    ./locale.nix
    ./neovim.nix
    ./nvidia.nix
    ./packages.nix
    ./packages
    ./pipewire.nix
    ./sops.nix
    ./steam.nix
    #./zfs.nix
  ];
  #main-user.enable = true;
  #main-user.userName = "eggy";
  # Enables home-manager, and flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  security.pam.services.hyprlock = { };

  custom.desktop.enable = lib.mkDefault false;
  custom.nvidia.enable = lib.mkDefault false;
  custom.framework.enable = lib.mkDefault false;

  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

  #custom.zfs-server.enable =
  #  lib.mkDefault false;

  # networking.wireless.enable = true; # Enables wireless support via wpa_supplicant

}
