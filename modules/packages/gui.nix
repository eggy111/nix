#gui.nix
{ config, pkgs, lib, ... }:
{
 options = {
   custom.gui.enable = 
     lib.mkEnableOption "programs that you would use on a desktop";
 };

 config = lib.mkIf config.custom.gui.enable {

   programs.droidcam.enable = true;

   environment.systemPackages = with pkgs; [
     mpv

     #productivity related goods
     onlyoffice-bin
    
     #misc
     rofimoji

     #shell related packages
     kitty

     #file manager and related
     xfce.thunar
     qdirstat

     #screen capture and video stuff
     vlc
     ffmpeg
     #droidcam

     #terminal applications #i know you dont need a gui for these, but they are applications i dont need on my servers :P
     lavat
     pipes
     pamixer
     pokeget-rs
     claws-mail

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
