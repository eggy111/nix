#steam.nix
#opengl, and maybe also proton stuff

{
  pkgs,
  lib,
  config,
  ...
}:

{
  options = {
    custom.steam.enable = lib.mkEnableOption "enables steam";
  };

  config = lib.mkIf config.custom.steam.enable {

    hardware.graphics = {
      enable = true;
      #    driSupport = true;
      enable32Bit = true;
    };

    programs.steam.enable = true;
    programs.steam.gamescopeSession.enable = true;

    environment.systemPackages = with pkgs; [
      mangohud
      protonup
    ];

    programs.gamemode.enable = true;

    environment.sessionVariables = {
      STEAM_EXTRA_COMPAT_TOOLS_PATH = "/home/eggy/.stean/root/compatibilitytools.d";
    };
  };
}
