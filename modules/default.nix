#default.nix
#barrel file for my modules
{ inputs, ... }: # lib is used in the .mkDefault, and inputs is used to define nixpkgs
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


  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ]; # sets nixpkgs to follow it as defined in flake.nix

  # networking.wireless.enable = true; # Enables wireless support via wpa_supplicant

}
