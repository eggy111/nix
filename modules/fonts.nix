# fonts.nix
# configuration file to load fonts

{  pkgs, lib, ... }:

{

  environment.systemPackages = with pkgs; [
    liberation_ttf_v1
    # nerdfonts

  ];

  fonts.packages = (lib.filter lib.isDerivation (lib.attrValues pkgs.nerd-fonts)) ++ [ pkgs.liberation_ttf_v1 ];

}
