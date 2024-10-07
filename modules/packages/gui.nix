#gui.nix
{ config, pkgs, lib, ... }:
{
 options = {
   custom.gui.enable = 
     lib.mkEnableOption "programs that you would use on a desktop";
 };

 config = lib.mkIf config.custom.gui.enable {
   environment.systemPackages = with pkgs; [
     mpv

     #productivity related goods
     onlyoffice-bin
    
     #misc
     rofimoji

     #file manager and related
     xfce.thunar
     qdirstat

     #terminal applications #i know you dont need a gui for these, but they are applications i dont need on my servers :P
     lavat
     pipes
     pamixer
     pokeget-rs

     #interfaces/menus
     overskride
     pavucontrol
     networkmanagerapplet

     #game/music/misc-related
     plexamp
     #kdePackages.kdeconnect-kde
   ];
  programs.kdeconnect.enable = true;
 };
}
