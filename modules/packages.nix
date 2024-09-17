# packages.nix
# install system packages here
{ config, pkgs, inputs,... }:
{
 environment.systemPackages = with pkgs; [
   qt6Packages.qwlroots #what is this package bruh
   
   #misc
   nerdfonts

   #shell related packages
   fish
   starship
   kitty
   eww # i know this isnt specific to wayland

   #wayland applications
   rofi-wayland
   waybar
   swww
   wl-clipboard

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

   #screen capture and video stuff
   grim
   slurp
   wf-recorder
   inputs.focal.packages.${pkgs.system}.default
   vlc
   ffmpeg

   #terminal applications
   git
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
   sshfs

   #notifications
   libnotify
   inotify-tools
   dunst

   #interfaces/menus
   overskride
   pavucontrol
   networkmanagerapplet
   
   #gaming/music/misc-related
   discord
   plexamp
   protonup
   kdePackages.kdeconnect-kde

  ];
}
