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

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
 
  nixpkgs.config.allowUnfree = true;
}
