# fonts.nix
# configuration file to load fonts

{ pkgs, lib, ... }:

{

  environment.systemPackages = with pkgs; [
    liberation_ttf_v1
    # akkadian
    # nerdfonts

  ];

  fonts.packages = (lib.filter lib.isDerivation (lib.attrValues pkgs.nerd-fonts)) ++ [
    pkgs.liberation_ttf_v1
    pkgs.noto-fonts
    # pkgs.noto-fonts-cuneiform
  ];

}
