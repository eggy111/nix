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

    nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

    services.resolved = {
      enable = true;
    };

    networking.firewall = rec {
      allowedTCPPortRanges = [
        {
          from = 1714;
          to = 1764;
        }
      ];
      allowedUDPPortRanges = allowedTCPPortRanges;
    };
    environment.systemPackages = with pkgs; [
      mpv # camera tool
      nodejs
      python312Packages.pip

      #productivity related goods
      onlyoffice-bin # office suite
      thunderbird # mail client

      #misc
      dos2unix # girl i dont even know what this is
      via
      kando

      #shell related packages

      #file manager and related
      xfce.thunar # gui file manager
      qdirstat # gui filesize viewer

      #screen capture and video stuff
      vlc # video player
      ffmpeg # tool for interacting with video
      swappy # quick picture editor
      gthumb # slower but in depth picture editor i think

      #terminal applications #i know you dont need a gui for these, but they are applications i dont need on my servers :P
      lavat # lava lamp, just for funsies
      pipes # pipes, just for funsies, like the screensaver
      pamixer # i think this is for volume?
      pokeget-rs # generates pixel pokemon in terminal
      claws-mail # mail client I want to setup
      playerctl # tbh idk

      #interfaces/menus
      overskride # bluetooth manager
      pavucontrol # more audio thing
      networkmanagerapplet # manage network in tray
      # rpiboot

      #game/music/misc-related
      plexamp # music player
      dualsensectl
      trigger-control
      shortwave # ipradio
      freetube # youtube client
      r2modman # mod manager for risk of rain 2, i should move it into steam
      sunvox # synth software
      #kdePackages.kdeconnect-kde
    ];
    hardware.keyboard.qmk.enable = true;
    services.udev.packages = [ pkgs.via ];

    xdg.portal = {
      enable = true;
      #wlr.enable = true;
      #config.common.default = "*";
      extraPortals = [
        pkgs.xdg-desktop-portal-gtk
      ];
    };

    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };

    programs.droidcam.enable = true; # use phone as camera

    programs.kdeconnect.enable = true; # interact with phone from computer

    #Enable the X11 windowing system
    #services.xserver.enable - true;

    #Enable GNOME Desktop Environment
    #services.xserver.displayManager.gdm.enable = true;
    #services.xserver.desktopManager.gnome.enable = true;
  };
}
