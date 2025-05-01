{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
{
  options = {
    custom.minecraft.enable = lib.mkEnableOption "enables minecraft via prism launcher";
  };

  config = lib.mkIf config.custom.minecraft.enable {

    nixpkgs.overlays = [ inputs.polymc.overlay ];
    environment.systemPackages = with pkgs; [
      polymc
    ];

  };
}
