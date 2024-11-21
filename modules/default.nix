#default.nix
#barrel file for my modules
{ lib, inputs, ... }: # lib is used in the .mkDefault, and inputs is used to define nixpkgs
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

  custom.desktop.enable = lib.mkDefault false; # sets desktop.nix to be disabled by default since I only want it on my desktop system

  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ]; # sets nixpkgs to follow it as defined in flake.nix

  # networking.wireless.enable = true; # Enables wireless support via wpa_supplicant

}
