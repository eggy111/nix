{
  config,
  pkgs,
  lib,
  ...
}:
{
  options = {
    custom.minecraft.enable = lib.mkEnableOption "enables minecraft via prism launcher";
  };

  config = lib.mkIf config.custom.minecraft.enable {
    environment.systemPackages = with pkgs; [
      prismlauncher
    ];

  };
}
