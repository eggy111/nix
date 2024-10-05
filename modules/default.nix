#default.nix
#barrel file for my modules
{ 
  imports = 
   [
    ./users
    ./bluetooth.nix
    ./desktop.nix
    ./discord.nix
    ./fonts.nix
    ./framework.nix
    ./graphics.nix
    ./locale.nix
    ./neovim.nix
    ./nvidia.nix
    ./packages.nix
    ./packages
    ./pipewire.nix
    ./steam.nix
  ];
 #main-user.enable = true;
 #main-user.userName = "eggy";
 # Enables home-manager, and flakes
 nix.settings.experimental-features = ["nix-command" "flakes"];

 # Allow unfree packages
 nixpkgs.config.allowUnfree = true;
 
 security.pam.services.hyprlock = { };
}
