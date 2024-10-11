# packages.nix
# install system packages here
{ config, pkgs, inputs,... }:
{
 environment.systemPackages = with pkgs; [
   qt6Packages.qwlroots #what is this package bruh
   #mpv
   
   #productivity related goods
   #onlyoffice-bin
   qalculate-qt

   #misc
   #liberation_ttf_v1
   #nerdfonts
   #rofimoji
   zint
   procps # Utilities that give information about processes using the /proc filesystem
   #brightnessctl
   texliveTeTeX

   #shell related packages
   fish
   starship
   #kitty
   #eww # i know this isnt specific to wayland

   #wayland applications
   #rofi-wayland
   #waybar
   #swww
   #wl-clipboard

   #hypr
   #hyprcursor
   #inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
   #hyprshot #idk if I even want this isnce I got frim and slurp running
   #hyprshade
   #hypridle
   #hyprlock

   #file manager and related
   yazi
   lf
   #xfce.thunar
   ncdu
   tree

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
   #lavat
   neovim
   #pipes
   #pamixer
   zip
   yt-dlp
   #pokeget-rs
   pandoc
   #whipper

   #file transfer things
   wireguard-tools
   localsend
   termscp
   sshfs

   #notifications
   #libnotify
   #inotify-tools
   #dunst

   #interfaces/menus
   #overskride
   #pavucontrol
   #networkmanagerapplet
   
   #gaming/music/misc-related
   #plexamp
   #kdePackages.kdeconnect-kde

  ];
}
