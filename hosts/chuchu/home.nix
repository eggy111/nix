{ pkgs, inputs, ... }:
{
  # host specific home-manager configuration here
  # services.easyeffects = {
  #   enable = true;
  #   preset = "kieran_levin";
  # };
  #
  # xdg.configFile."easyeffects/output".source = pkgs.fetchFromGitHub {
  #   owner = "ceiphr";
  #   repo = "ee-framework-presets";
  #   rev = "27885fe00c97da7c441358c7ece7846722fd12fa";
  #   hash = "sha256-z2WmozMDMUkiAd+BEc/5+DHgFXDbw3FdsvBwgIj0JmI=";
  # };
  wayland.windowManager.hyprland = {
    settings = {
      misc = {
        "force_default_wallpaper" = 0;
      };
    };
  };
  wayland.windowManager.hyprland = {
    # extraConfig = ''
    # plugin = hyprgrass
    # gestures {
    # workspace_swipe = true
    # workspace_swipe_fingers = 3
    # workspace_swipe_distance = 300
    # }
    # '';

    plugins = [
      inputs.hyprgrass.packages.${pkgs.system}.hyprgrass
    ];
  };
}
