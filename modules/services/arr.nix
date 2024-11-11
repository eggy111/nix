# modules/services/arr.nix

{ ... }:

{
  services = {
    radarr = {
      enable = true;
      dataDir = /radarr;
    };
    sonarr = {
      enable = true;
      dataDir = /sonarr;
    };
    prowlarr = {
      enable = true;
    };
    tautulli = {
      enable = true;
      dataDir = /tautulli;
      port = 8181;
      configFile = /tautulli/config;
    };
  };
}
