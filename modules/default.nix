#default.nix
#barrel file for my modules
{ 
  imports = 
   [
    ./bluetooth.nix
    ./discord.nix
    ./fonts.nix
    ./framework.nix
    ./locale.nix
    ./main-user.nix
    ./neovim.nix
    ./nvidia.nix
    ./packages.nix
    ./pipewire.nix
    ./steam.nix
  ];
 main-user.enable = true;
 main-user.userName = "eggy";
 # Enables home-manager, and flakes
 nix.settings.experimental-features = ["nix-command" "flakes"];

 # Allow unfree packages
 nixpkgs.config.allowUnfree = true;
 
 security.pam.services.hyprlock = { };
}
