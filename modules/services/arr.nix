# modules/services/arr.nix

{ lib, config, ... }:

{
  options = {
    custom.arr.enable = lib.mkEnableOption "arr stack";
  };
  config = lib.mkIf config.custom.arr.enable {
    services = {
      radarr = {
        enable = true;
        dataDir = /vault/radarr;
      };
      sonarr = {
        enable = true;
        dataDir = /vault/sonarr;
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
        dataDir = /vault/tautulli;
        port = 8181;
        configFile = /vault/tautulli/config;
      };
    };
    networking.firewall.allowedTCPPorts = [
      8989 # sonarr
      7878 # radarr
      9696 # prowlarr
      5055 # overseerr
      8181 # tautulli
    ];
  };
}
