# modules/services/plex.nix
{
  lib,
  config,
  pkgs,
  ...
}:
{
  options = {
    custom.plex.enable = lib.mkEnableOption "plex media server";
  };
  config = lib.mkIf config.custom.plex.enable {
    services.plex = {
      enable = true;
      dataDir = "/var/lib/plex";
      openFirewall = true;
    };

    networking.firewall.allowedTCPPorts = [ 32400 ];

    users.users.plex.extraGroups = [ "media" ];
  };
}
