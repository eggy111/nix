#default.nix
#barrel file for my modules
{ lib, inputs, ... }:
{
  imports = [
    ./bluetooth.nix
    ./commands.nix
    ./fonts.nix
    ./locale.nix
    ./packages
    ./pipewire.nix
    ./sops.nix
    ./systems
    ./users
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

  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

  # networking.wireless.enable = true; # Enables wireless support via wpa_supplicant

}
