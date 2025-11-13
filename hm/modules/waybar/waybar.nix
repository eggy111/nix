# waybar.nix
# a home-manager module

{
  pkgs,
  # lib,
  # config,
  ...
}:
{
  home.file = {
    ".config/waybar/custom/plexbar/plexbar" = {
      executable = true;
      source = ./plexbar;
    };
  };
  home.packages = with pkgs; [ waybar-mpris ];

  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        "reload_style_on_change" = true;
        height = 33;
        spacing = 4;
        modules-left = [
          "group/quicklinks-left"
          # "custom/waybar-mpris"
          "custom/focal"
        ];
        modules-center = [ "hyprland/workspaces" ];
        modules-right = [
          "bluetooth"
          "mpd"
          "idle_inhibitor"
          "pulseaudio"
          "network"
          "power-profiles-daemon"
          "cpu"
          "memory"
          "temperature"
          "backlight"
          "battery"
          "clock"
          "tray"
          "custom/power"
        ];
        "hyprland/workspaces" = {
          disable-scroll = true;
          sort-by = "number";
          all-outputs = true;
          warp-on-scroll = false;
          format = "{name}";
          # "format-icons":  = {

          # };
        };

        # "hyprland/workspaces" = {
        #   "format" = ''<sub>{icon}</sub>\n{windows}'';
        #   "format-window-separator" = "\n";
        #   "window-rewrite-default"= "";
        #   "window-rewrite" = {
        #     "title<.*youtube.*>" = "";
        #     "class<firefox" = "";
        #     "class<firefox> title<.*github.*>" = "";
        #     "foot" = "";
        #   };
        # };

        "group/quicklinks-left" = {
          orientation = "horizontal";
          modules = [
            "custom/nix"
            # "custom/hyprland"
          ];
        };
        "custom/nix" = {
          format = "";
          tooltip = true;
          tooltip-format = "Open nix directory";
          on-click = "kitty ~/Documents/nix";
          size = 18;
        };

        "custom/focal" = {
          exec = "focal-waybar --recording 'REC'";
          format = "{}";
          on-click = "focal video --stop";
          signal = 1;
        };

        #"custom/hyprland" = {
        #  "format" = " home ";
        #  "tooltip = true;<D-R>
        #  "tooltip-format" = "open hyprland config";
        #  "on-click" = "kitty vim ~/.config/hypr/hyprland.conf";
        #};

        # "custom/plexbar" = {
        #   format = "{} ♪";
        #   max-length = 60;
        #   interval = 30;
        #   return-type = "json";
        #   exec = "bash ~/.config/waybar/custom/plexbar/plexbar";
        #   signal = 5;
        #   smooth-scrolling-threshold = 1.0;
        #   exec-if = "pgrep plexamp";
        # };

        # "custom/waybar-mpris" = {
        #   "return-type" = "json";
        #   "exec" = "waybar-mpris --position --autofocus";
        #   on-click = "waybar-mpris --send toggle";
        #   "on-scroll-up" = "waybar-mpris --send next";
        #   "on-scroll-down" = "waybar-mpris --send previous";
        #   "escape" = true;
        #   # "format" = "{icon} {title}";
        #   # "tooltip" = true;
        # };

        clock = {
          tooltip-format = ''
            <big>{:%Y %B}</big>
            <tt><small>{calendar}</small></tt>
          '';
          format-alt = "{:%Y-%m-%d}";
        };

        cpu = {
          format = "{usage}% ";
          tooltip = false;
          on-click = "pypr toggle btop";
        };

        memory = {
          format = "{}% ";
        };

        temperature = {
          critical-threshold = 80;
          format = "{temperatureC}°C {icon}";
          format-icons = [ "" ];
        };

        backlight = {
          format = "{percent}% {icon}";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
          ];
        };

        battery = {
          states = {
            "good" = 95;
            "warning" = 30;
            "critical" = 15;
          };
          format = "{capacity}% {icon}";
          format-full = "{capacity}% {icon}";
          format-charging = "{capacity}% 󰂄";
          format-plugged = "{capacity}% ";
          format-alt = "{time} {icon}";
          #format-good = "";
          #format-full = "";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
          ];
        };

        power-profiles-daemon = {
          format = "{icon}";
          tooltip-format = ''
            Power profile: {profile}
            Driver: {driver}
          '';
          tooltip = true;
          format-icons = {
            #"default" = " ";
            performance = "";
            balanced = "";
            power-saver = "";
          };
        };

        network = {
          format-wifi = "{signalStrength}% ";
          format-ethernet = "{ipaddr}/{cidr} 󰈀";
          tooltip-format = ''
            {essid}
            {ipaddr}
            {ifname} via {gwaddr}  
          '';
          format-linked = "{ifname} (No IP) 󰛵 ";
          format-disconnected = "Disconnected ⚠";
          format-alt = "{ifname}: {ipaddr}/{cidr}";
        };

        pulseaudio = {
          format = "{volume}% {icon} {format_source}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = "󰝟 {icon} {format_source}";
          format-muted = "󰝟 {format_source}";
          format-source = "{volume}% ";
          format-source-muted = "";
          format-icons = {
            "default" = [
              ""
              ""
              ""
            ];
          };
          on-click = "pypr toggle volume";
        };

        "custom/power" = {
          format = "⏻ ";
          tooltip = false;
          on-click = ''rofi -show power-menu -modi power-menu:~/.config/rofi/rofi-power-menu -theme Paper -theme-str 'window {width: 8em;} listview {lines: 6;}' '';
        };

        idle_inhibitor = {
          format = "{icon}";
          format-icons = {
            activated = "";
            deactivated = "";
          };
        };
        mpd = {
          format = " {title}";
          format-paused = " {title}";
          format-stopped = " Stopped";
          title-len = 20;
          tooltip-format = ''
            {artist}
            {title}
          '';
          interval = 2;
          "scroll" = true;
          on-click = "playerctl play-pause";
          on-scroll-up = "playercl next";
          on-scroll-down = "playerctl previous";
        };

        bluetooth = {
          format = " {status}";
          format-disabled = "";
          format-connected = " {num_connections}";
          tooltip-format = "{controller_alias}\t{controller_address}";
          tooltip-format-connected = ''{controller_alias}\t{controller_address}\n\n{device_enumerate}'';
          tooltip-format-enumerate-connected = ''{device_alias}\t{device_address}'';
          on-click = "pypr toggle bluetooth";
        };
      };
    };
  };
}
