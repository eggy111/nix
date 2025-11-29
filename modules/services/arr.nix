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
      tautulli = {
        enable = true;
        dataDir = /vault/tautulli;
        port = 8181;
        configFile = /vault/tautulli/config;
      };
    };
  };
}
