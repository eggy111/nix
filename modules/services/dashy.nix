{ lib, config, ... }:
{
  options = {
    custom.dashy.enable = lib.mkEnableOption "Dashboard option";
  };

  config = lib.mkIf config.custom.dashy.enable {

   services.dashy = {
     enable = true;

    };
 };
}
