#modules/packages/default.nix
{ config, pkgs, inputs,... }:
{
 imports = 
  [
   ./hyprland.nix
   ./gui.nix  
  ];
}
