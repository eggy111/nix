{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    custom.i2p.enable = lib.mkEnableOption "enables i2p";
  };

  config = lib.mkIf config.custom.i2p.enable {
    environment.systemPackages = with pkgs; [ mullvad-browser ];
    services.i2pd = {
      enable = true;
      address = "127.0.0.1";
      proto = {
        http.enable = true;
        socksProxy.enable = true;
        httpProxy.enable = true;
        sam.enable = true;
        i2cp = {
          enable = true;
          address = "127.0.0.1";
          port = 7654;
        };
      };
    };
  };
}
