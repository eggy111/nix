{ lib, config, ... }:
{
  options = {
    custom.homepage.enable = lib.mkEnableOption "Dashboard option";
  };

  config = lib.mkIf config.custom.homepage.enable {

    services.homepage-dashboard = {
      enable = true;
      services = [
        {
          "My First Group" = [
            {
              "My first service" = {
                description = "plz work";
                href = "https://board.eggy.lol";
              };
            }
          ];
        }
      ];
    };
  };
}
