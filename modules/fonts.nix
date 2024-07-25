# fonts.nix
# configuration file to load fonts

{ config, pkgs, ... }:

{
 fonts.packages = [pkgs.nerdfonts];
 }
