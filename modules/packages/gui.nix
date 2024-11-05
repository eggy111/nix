#gui.nix
{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
{
  options = {
    custom.gui.enable = lib.mkEnableOption "programs that you would use on a desktop";
  };

  config = lib.mkIf config.custom.gui.enable {

    nix.nixPath = ["nixpkgs=${inputs.nixpkgs}" ];

   networking.firewall = rec {
     allowedTCPPortRanges = [ { from = 1714; to = 1764; } ];
     allowedUDPPortRanges = allowedTCPPortRanges;
   };
    environment.systemPackages = with pkgs; [
      mpv

      #productivity related goods
      onlyoffice-bin
      thunderbird

      #misc
      dos2unix

      #shell related packages
      kitty

      #file manager and related
      xfce.thunar
      qdirstat

      #screen capture and video stuff
      vlc
      ffmpeg
      swappy
      gthumb

      #terminal applications #i know you dont need a gui for these, but they are applications i dont need on my servers :P
      lavat
      pipes
      pamixer
      pokeget-rs
      claws-mail
      playerctl

      #interfaces/menus
      overskride
      pavucontrol
      networkmanagerapplet

     #game/music/misc-related
     plexamp
     shortwave
     freetube
     #kdePackages.kdeconnect-kde
   ];

    xdg.portal = {
      enable = true;
      #wlr.enable = true;
      #config.common.default = "*";
      extraPortals = [
        pkgs.xdg-desktop-portal-gtk
      ];
    };

    programs.hyprland = {
      enable = true;
      #package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    };

    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };

    programs.droidcam.enable = true;

    programs.kdeconnect.enable = true;

    #Enable the X11 windowing system
    #services.xserver.enable - true;

    #Enable GNOME Desktop Environment
    #services.xserver.displayManager.gdm.enable = true;
    #services.xserver.desktopManager.gnome.enable = true;
  };
}
