#gui.nix
{
  config,
  pkgs,
  lib,
  ...
}:
{
  options = {
    custom.gui.enable = lib.mkEnableOption "programs that you would use on a desktop";
  };

  config = lib.mkIf config.custom.gui.enable {

   networking.firewall = rec {
     allowedTCPPortRanges = [ { from = 1714; to = 1764; } ];
     allowedUDPPortRanges = allowedTCPPortRanges;
   };
    environment.systemPackages = with pkgs; [
      mpv

      #productivity related goods
      onlyoffice-bin

      #misc

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

<<<<<<< HEAD
      #game/music/misc-related
      plexamp
      #kdePackages.kdeconnect-kde
    ];
=======
     #game/music/misc-related
     plexamp
     freetube
     #kdePackages.kdeconnect-kde
   ];
>>>>>>> 84dded5 (idk what I did again)

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

<<<<<<< HEAD
    programs.droidcam.enable = true;
=======
>>>>>>> 84dded5 (idk what I did again)

    programs.kdeconnect.enable = true;

    #Enable the X11 windowing system
    #services.xserver.enable - true;

    #Enable GNOME Desktop Environment
    #services.xserver.displayManager.gdm.enable = true;
    #services.xserver.desktopManager.gnome.enable = true;
  };
}
