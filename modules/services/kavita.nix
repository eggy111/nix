# modules/services/kavita.nix
{ lib, config, ... }:
{

  options = {
    custom.kavita.enable = lib.mkEnableOption "Kavita Manga Reader";
  };

  config = lib.mkIf config.custom.kavita.enable {
    networking.firewall.allowedTCPPorts = [ 5000 ];
    services.kavita = {
      enable = true;
      port = 5000;
      dataDir = "/mnt/media/manga";
      settings.Port = 5000;
    };
  };
}
