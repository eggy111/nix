{
  lib,
  config,
  pkgs,
  ...
}:
{
  options.custom.sunshine.enable = lib.mkEnableOption "sunshine game streaming";

  config = lib.mkIf config.custom.sunshine.enable {
    services.sunshine = {
      enable = true;
      autoStart = true;
      capSysAdmin = true;
      openFirewall = true;
    };
    environment.systemPackages = with pkgs; [
      moonlight-qt
    ];
  };
}
