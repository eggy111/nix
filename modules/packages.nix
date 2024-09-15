# packages.nix
# install system packages here
{ config, pkgs, ... }:
{
 environment.systemPackages = with pkgs; [
   git
   discord
   plexamp
   swww
   eww
   qt6Packages.qwlroots
   wl-clipboard
   nerdfonts
   networkmanagerapplet
   overskride
   pavucontrol
   protonup
   kdePackages.kdeconnect-kde
   vlc
   ffmpeg

   #shell related packages
   fish
   starship
   kitty

   #wayland applications
   rofi-wayland
   waybar

   #hypr
   hyprcursor
   hyprshot #idk if I even want this isnce I got frim and slurp running
   hyprshade
   hypridle
   hyprlock

   #file manager and related
   yazi
   lf
   xfce.thunar
   ncdu

   #screen capture
   grim
   slurp
   wf-recorder

   #terminal applications
   sshfs
   fzf
   unar
   unzip
   bat
   neofetch
   wget
   vim 
   neovim
   pipes

   #file transfer things
   wireguard-tools
   localsend
   swappy
   termscp

   #notifications
   libnotify
   inotify-tools
   dunst
  ];
}
