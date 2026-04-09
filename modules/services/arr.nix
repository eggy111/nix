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
    users.groups.media = { };
    users.users = {
      radarr.extraGroups = [ "media" ];
      sonarr.extraGroups = [ "media" ];
      eggy.extraGroups = [ "media" ]; # this should probably go in the users directory, but my users are a little funky right now so im not touching them for the time being
    };
    systemd.services.rclone-seedbox-movies = {
      description = "Move movies from seebox";
      serviceConfig = {
        Type = "oneshot";
        User = "eggy";
        ExecStart = ''
          ${pkgs.rclone}/bin/rclone move \
          seedbox:/home/eggy/.config/sabnzbd/Downloads/complete/movie \
          /mnt/media/downloads/movie \
          --delete-empty-src-dirs \
          --log-file=/home/eggy/.rclone/rclone.log \
          --log-level=INFO
        '';
      };
      onSuccess = [ "fix-movie-perms.service" ];
    };
    systemd.services.fix-movie-perms = {
      description = "Fix permissions on movie folder";
      serviceConfig = {
        Type = "oneshot";
        User = "root";
        ExecStart = "${pkgs.bash}/bin/bash -c '${pkgs.coreutils}/bin/chown -R radarr:media /mnt/media/downloads/movie && ${pkgs.coreutils}/bin/chmod -R 775 /mnt/media/downloads/movie'";
      };
    };
    systemd.services.rclone-seedbox-tv = {
      description = "Move tv from seedbox";
      serviceConfig = {
        Type = "oneshot";
        User = "eggy";
        ExecStart = ''
          ${pkgs.rclone}/bin/rclone move \
          seedbox:/home/eggy/.config/sabnzbd/Downloads/complete/tv \
          /mnt/media/downloads/tv \
          --delete-empty-src-dirs \
          --log-file=/home/eggy/.rclone/rclone.log \
          --log-level=INFO
        '';
      };
      onSuccess = [ "fix-tv-perms.service" ];
    };
    systemd.services.fix-tv-perms = {
      description = "Fix permissions on tv folder";
      serviceConfig = {
        Type = "oneshot";
        User = "root";
        ExecStart = "${pkgs.bash}/bin/bash -c '${pkgs.coreutils}/bin/chown -R sonarr:media /mnt/media/downloads/tv && ${pkgs.coreutils}/bin/chmod -R 775 /mnt/media/downloads/tv'";
      };
    };
    systemd.timers.rclone-seedbox-movies = {
      wantedBy = [ "timers.target" ];
      timerConfig = {
        OnBootSec = "2m";
        OnUnitActiveSec = "5m";
      };
    };
    systemd.timers.rclone-seedbox-tv = {
      wantedBy = [ "timers.target" ];
      timerConfig = {
        OnBootSec = "2m";
        OnUnitActiveSec = "5m";
      };
    };
    systemd.tmpfiles.rules = [
      "d /mnt/media/downloads 0775 eggy media -"
      "d /mnt/media/downloads/movie 0775 radarr media -"
      "d /mnt/media/downloads/tv 0775 sonarr media -"
      "d /mnt/media/movies 0775 radarr media -"
      "d /mnt/media/tv 0775 sonarr media -"
    ];
  };
}
