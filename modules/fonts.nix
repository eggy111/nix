# fonts.nix
# configuration file to load fonts

{  pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    liberation_ttf_v1
    nerdfonts

  ];

  fonts.packages = [ pkgs.nerdfonts ];
}
