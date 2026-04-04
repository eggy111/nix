# modules/services/arr.nix
# after doing some research, the datadirs and configdirs are probably better suited living where they belong, managed by nixos

{
  lib,
  config,
  pkgs,
  ...
}:

{
  options = {
    custom.arr.enable = lib.mkEnableOption "arr stack";
  };
  config = lib.mkIf config.custom.arr.enable {
    services = {
      radarr = {
        enable = true;
        # dataDir = "/vault/radarr";
      };
      sonarr = {
        enable = true;
        # dataDir = "/vault/sonarr";
        openFirewall = true;
        settings = {
          server = {
            bindaddress = "*";
            port = 8989;
          };
        };
      };
      prowlarr = {
        enable = true;
      };
      overseerr = {
        enable = true;
        port = 5055;
      };
      tautulli = {
        enable = true;
        # dataDir = "/vault/tautulli";
        port = 8181;
        # configFile = "/vault/tautulli/config";
      };
      bazarr = {
        enable = true;
        openFirewall = true;
      };
    };
    networking.firewall.allowedTCPPorts = [
      8989 # sonarr
      7878 # radarr
      9696 # prowlarr
      5055 # overseerr
      8181 # tautulli
    ];
    systemd.services.rclone-seedbox-movies = {
      description = "Move movies from seebox";
      serviceConfig = {
        Type = "oneshot";
        User = "eggy";
        ExecStart = ''
          ${pkgs.rclone}/bin/rclone move \
          seedbox:/home/eggy/.config/sabnzbd/Downloads/complete/movie \
          /mnt/media/downloads \
          --delete-empty-src-dirs \
          --log-file=/home/eggy/.rclone/rclone.log \
          --log-level=INFO
        '';
      };
    };
    systemd.services.rclone-seeedbox-tv = {
      description = "Move tv from seedbox";
      serviceConfig = {
        Type = "oneshot";
        User = "eggy";
        ExecStart = ''
          ${pkgs.rclone}/bin/rclone \
          seedbox:/home/eggy/.config/sabnzbd/Downloads/complete/tv \
          --delete-empty-src-dirs \
          --log-file=/home/eggy/.rclone/rclone.log \
          --log-level=INFO
        '';
      };
    };
    systemd.timers.rclone-seedbox-movies = {
      wantedBy = [ "timers.target" ];
      timerConfig = {
        OnBootSec = "2m";
        OnUnitActiveSec = "5m";
      };
    };
    systemd.timers.rclone-seebox-tv = {
      wantedBy = [ "timers.target" ];
      timerConfig = {
        OnBootSec = "2m";
        OnUnitActiveSec = "5m";
      };
    };
  };
}
