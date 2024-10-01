# packages.nix
# install system packages here
{ config, pkgs, inputs,... }:
{
 environment.systemPackages = with pkgs; [
   qt6Packages.qwlroots #what is this package bruh
   mpv
   
   #productivity related goods
   onlyoffice-bin
   qalculate-qt

   #misc
   liberation_ttf_v1
   nerdfonts
   rofimoji
   zint
   procps
   brightnessctl
   inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
   texliveTeTeX

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
   droidcam

   #terminal applications
   git
   fzf
   frogmouth
   unar
   unzip
   bat
   neofetch
   wget
   vim 
   eza
   lavat
   neovim
   pipes
   pamixer
   zip
   yt-dlp
   pokeget-rs
   pandoc

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
   plexamp
   protonup
   kdePackages.kdeconnect-kde

  ];
}
