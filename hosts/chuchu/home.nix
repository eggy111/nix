{
  lib,
  pkgs,
  inputs,
  ...
}:
{
  # host specific home-manager configuration here
  # services.easyeffects = {
  #   enable = true;
  #   preset = "kieran_levin";
  # };
  #
  # xdg.configFile."easyeffects/output".source = pkgs.fetchFromGitHub {
  #   owner = "ceiphr";
  #   repo = "ee-framework-presets";
  #   rev = "27885fe00c97da7c441358c7ece7846722fd12fa";
  #   hash = "sha256-z2WmozMDMUkiAd+BEc/5+DHgFXDbw3FdsvBwgIj0JmI=";
  # };
  services.mpd = {
    enable = true;
    musicDirectory = "~/Music";
    extraConfig = ''
      auto_update "yes"
      restore_paused "yes"
      audio_output {
      type "pulse"
      name "pulse"
      }
    '';
  };
  services.mpd-mpris = {
    enable = true;
  };
  programs.hyprlock = {
    settings = {
      background = [
        {
          path = lib.mkForce "/home/eggy/.config/wallpapers/23.png";
        }
      ];
    };

  };
  wayland.windowManager.hyprland = {
    settings = {
      misc = {
        "force_default_wallpaper" = 0;
      };
    };
  };
  wayland.windowManager.hyprland = {

    plugins = [
      inputs.hyprgrass.packages.${pkgs.stdenv.hostPlatform.system}.hyprgrass
      # inputs.Hyprspace.packages.${pkgs.system}.Hyprspace
    ];
    settings = {
      exec-once = [
        "squeekboard"
      ];

      monitor = [ "DP-1, preferred, auto, auto" ];

      plugin = {
        hyprgrass-bind = [
          " , tap:4, exec, kill -34 $(ps -C wvkbd-mobintl)"
          " , edge:u:d, exec, wvkbd-mobintl"
        ];
        touch_gesture = {
          sensitivity = 1.0;
          workspace_swipe_finger = 3;
          workspace_swipe_edge = "d";
          long_press_delay = 400;
          resize_on_border_long_press = true;
          edge_margin = 10;
          emulate_touch_swipe = false;
        };

      };
    };

  };
}
