#hyprland.nix
{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:

{
  options = {
    custom.hyprland.enable = lib.mkEnableOption "enables hyprland";
  };

  config = lib.mkIf config.custom.hyprland.enable {

    programs.hyprland = {
      enable = true;
      #package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    };

    environment.systemPackages = with pkgs; [

      #Wayland related packages
      rofi-wayland
      rofi-bluetooth
      rofi-power-menu
      rofimoji
      waybar
      swww
      wl-clipboard
      pyprland

      hyprland
      hyprland-qtutils
      hyprcursor
      #hyprshot #idk if I even want this since I got grim and slurp running
      hyprshade
      hyprsunset
      hypridle
      hyprlock
      inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default

      #notifications
      libnotify
      inotify-tools
      dunst

      #screen capture and video stuff
      grim
      slurp
      wf-recorder
      inputs.focal.packages.${pkgs.system}.default

      brightnessctl
      # eww
    ];
  };
}
