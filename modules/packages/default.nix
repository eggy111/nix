#modules/packages/default.nix
{ config, pkgs, inputs, lib, ... }:
{
 imports = 
  [
   ./desktop.nix
   ./hyprland.nix
   ./gui.nix  
  ];
 custom.gui.enable = 
   lib.mkDefault true;
 custom.hyprland.enable =
   lib.mkDefault true;
 custom.desktop.enable = 
   lib.mkDefault false;
}
