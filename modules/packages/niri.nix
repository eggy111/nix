{ inputs, pkgs, ... }:
{
  # nixpkgs.overlays = [ niri.overlays.niri ];
  environment.systemPackages = with pkgs; [ niri ];
  #   programs.niri = {
  #     enable = true;
  #     settings = {
  #       binds = {
  #
  #         "Mod+Q".action.spawn = "kitty";
  #         "Mod+Shift+Q".action.spawn = [
  #           "kitty"
  #           "~"
  #         ];
  #         "Mod+C".action.spawn = "close-window";
  #         "Mod+Shift+C".action.spawn = [
  #           "mpv"
  #           "av://v4l2:/dev/video1"
  #           "--profile=low-latency"
  #           "--untimed"
  #         ];
  #         "Mod+R".action.spawn = [
  #           "rofi"
  #           "-show"
  #           "drun"
  #           "show-icons"
  #         ];
  #         "Mod+E".action.spawn = [
  #           "kitty"
  #           "yazi"
  #           "~"
  #         ];
  #         "Mod+Shift+E".action.spawn = [
  #           "rofi"
  #           "-modi"
  #           "emoji:rofimoji"
  #           "-show"
  #           "emoji"
  #         ];
  #
  #         "Mod+F".action.spawn = "firefox";
  #         "Mod+L".action.spawn = "hyprlock";
  #         "Mod+D".action.spawn = "discord";
  #         "Mod+Shift+D".action.spawn = "plexamp";
  #         "Mod+G".action.spawn = "steam";
  #       };
  #     };
  #   };
}
