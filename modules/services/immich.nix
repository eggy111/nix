{ lib, config, ... }:
{
  options = {
    custom.immich.enable = lib.mkEnableOption "photo library";
  };
  config = lib.mkIf config.custom.immich.enable {
    services.immich = {
      enable = true;
      host = "photos.eggy.lol";
      port = 2284;
      openFirewall = true;

    };
  };

}
