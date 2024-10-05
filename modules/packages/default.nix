#modules/packages/default.nix
{ config, pkgs, inputs, lib, ... }:
{
 imports = 
  [
   ./hyprland.nix
   ./gui.nix  
  ];
 custom.gui.enable = 
   lib.mkDefault true;
 custom.hyprland.enable =
   lib.mkDefault true;
}
