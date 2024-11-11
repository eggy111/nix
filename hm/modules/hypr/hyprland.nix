# hyprland.nix
# a home-manager module

{ pkgs, lib, config, ... }:

{

  home.file = {
    ".config/hypr/word-lookup.sh".source = ./word-lookup.sh;
  };

  wayland.windowManager.hyprland = {
   enable = true;
   settings = {

    bind = [
  
      "$mainMod, Q, exec, kitty ~"
      "$mainMod SHIFT, Q, exec, kitty ~/Documents/nix"
      "$mainMod, C, killactive,"
      "$mainMod, M, exit,"
      "$mainMod, V, togglefloating,"
      "$mainMod, R, exec, $menu"
      "$mainMod, P, pseudo # dwindle"
      "$mainMod, J, togglesplit # dwindle"
      "$mainMod, F, exec, firefox"
      "$mainMod, e, exec, kitty yazi ~"
      "$mainMod, D, exec, discord"
      "$mainMod SHIFT, D, exec, [floating] plexamp"
      "$mainMod, l, exec, hyprlock"
      "$mainMod SHIFT, l, exec, hyprlock --immediate"
      "$mainMod, G, exec, steam"
      "$mainMod SHIFT, C, exec, [floating] mpv av://v4l2:/dev/video1 --profile=low-latency --untimed"
      ''$mainMod SHIFT, e, exec, rofi -modi "emoji:rofimoji" -show emoji''
      "$mainMod, X, exec, word-lookup"

      # Pyprland Shortcuts
      # "$mainMod, B exec, pypr expose"
      "$mainMod SHIFT, V, exec, pypr toggle volume"
      "$mainMod, T, exec, pypr toggle term"
      "$mainMod SHIFT, T, exec, pypr toggle btop"
      "$mainMod, B, exec, pypr toggle bluetooth" 
      
      #wireguard bindings
      "$mainMod, W, exec, [floating] kitty wg-quick up $(hostname)"
      "$mainMod SHIFT, W, exec, [floating] kitty wg-quick down $(hostname)"
      
      #screen capture bindings
      ''$mainMod, S, exec, grim -g "$(slurp -w 0)" - | wl-copy''
      ''$mainMod SHIFT, S, exec, grim -g "$(slurp -w 0)" - | swappy -f -''
      "$mainMod, backslash, exec, focal video --rofi --no-rounded-windows"
      "$mainMod SHIFT, backslash, exec, focal --rofi --no-rounded-windows --audio"
     
      # hyprshade bindings
      "$mainMod, Z, exec, hyprshade on blue-light-filter"
      "$mainMod SHIFT, Z, exec, hyprshade off"
    
      # Move focus with mainMod + arrow keys
      "$mainMod, left, movefocus, l"
      "$mainMod, right, movefocus, r"
      "$mainMod, up, movefocus, u"
      "$mainMod, down, movefocus, d"

      "$mainMod SHIFT, F, fullscreen"

      
      # Switch Workspaces with mainMOd + [0-9]
      "$mainMod, 1, workspace, 1"
      "$mainMod, 2, workspace, 2"
      "$mainMod, 3, workspace, 3"
      "$mainMod, 4, workspace, 4"
      "$mainMod, 5, workspace, 5"
      "$mainMod, 6, workspace, 6"
      "$mainMod, 7, workspace, 7"
      "$mainMod, 8, workspace, 8"
      "$mainMod, 9, workspace, 9"
      "$mainMod, 0, workspace, 10"

      # Move active window to a workspace with  mainMOd + SHIFT + [0-9]
      "$mainMod SHIFT, 1, movetoworkspace, 1"
      "$mainMod SHIFT, 2, movetoworkspace, 2"
      "$mainMod SHIFT, 3, movetoworkspace, 3"
      "$mainMod SHIFT, 4, movetoworkspace, 4"
      "$mainMod SHIFT, 5, movetoworkspace, 5"
      "$mainMod SHIFT, 6, movetoworkspace, 6"
      "$mainMod SHIFT, 7, movetoworkspace, 7"
      "$mainMod SHIFT, 8, movetoworkspace, 8"
      "$mainMod SHIFT, 9, movetoworkspace, 9"
      "$mainMod SHIFT, 0, movetoworkspace, 10"
      
      # Example special workspace (scratchpad)
      "$mainMod, a, togglespecialworkspace, magic"
      "$mainMod SHIFT, a, movetoworkspace, special:magic"

      # Scroll through existing workspaces with mainMod + scroll
      "$mainMod, mouse_down, workspace, e+1"
      "$mainMod, mouse_up, workspace, e-1"


      # Volume and brightness control for laptop
      ",XF86MonBrightnessDown, exec, brightnessctl set 5%-"
      ",XF86MonBrightnessUp, exec, brightnessctl set +5%"
      ",XF86AudioLowerVolume, exec, pamixer -d 5"
      ",XF86AudioRaiseVolume, exec, pamixer -i 5"
      ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ",XF86AudioPlay, exec, playerctl play-pause"
      ",XF86AudioPrev, exec, playerctl previous"
      ",XF86AudioNext, exec, playerctl next"
    ];

    bindm = [  
      # Move/resize windows with mainMod + LMB/RMB and dragging
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resize window"
      "$mainMod SHIFT, mouse:272, resizewindow"
    ];
   
    exec-once = [
      #"bash ~/.config/hypr/start.sh &"
      "hypridle &"
      "swww-daemon &"
      "hyprctl set cursor rose-pine-hyprcursor 28 &"
      "waybar &"
      "nm-applet --indicator &"
      "dunst &"
      "wallpaper_setup&"
      "pypr"
    ];
  
    windowrulev2 = "suppressevent maximize, class:.*";
     
    monitor = [
      "DP-2, preferred, 0x0, auto #dell s3222dgm"
      "DP-3, preferred, 2560x0, auto #Dell U2515hx"
    ];

    env = [
      "XCURSOR_SIZE,24"
      "HYPRCURSOR_SIZE,24"
      "HYPRCURSOR_THEME,rose-pine-hyprcursor"
      "EDITOR,nvim"
      
    ];

      "$EDITOR" = "nvim";
      "$mainMod" = "SUPER";
      "$terminal" = "kitty";
      "$menu" = "rofi -show drun -show-icons";

    general = {
      gaps_in = 5;
      gaps_out = 20;
      border_size = 2;

      # https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
      "col.active_border" = "rgba(ea76cbee) rgba(7287fdee) 45deg";
      "col.inactive_border" = "rgba(595959aa)";

      # Set to true enable resizing windows by clicking and dragging on borders and gaps
      resize_on_border = false; 

      # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
      allow_tearing = false;

      layout = "dwindle";
    };
    
    cursor = {
      enable_hyprcursor = true;
    };
    
    # https://wiki.hyprland.org/Configuring/Variables/#decoration
    decoration = {
      rounding = 10;
      
      # Change transparency of focused and unfocused windows
      active_opacity = 1.0;
      inactive_opacity = .97;
      
      drop_shadow = true;
      shadow_range = 4;
      shadow_render_power = 3;
      "col.shadow" = "rgba(1a1a1aee)";
     
      # https://wiki.hyprland.org/Configuring/Variables/#blur
      blur = {
        enabled = true;
        size = 3;
        passes = 1;
        vibrancy = 0.1696;
      };
    };

    animations = {
      enabled = true;
      bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
      animation = [ 
        "windows, 1, 7, myBezier"
        "windowsOut, 1, 7, default, popin 80%"
        "border, 1, 10, default"
        "borderangle, 1, 8, default"
        "fade, 1, 7, default"
        "workspaces, 1, 6, default"
      ];
    };

    dwindle = {
      pseudotile = true; # Master switch for pseudotiling. Enabling is bound in keybinds
      preserve_split = true; 
    };

    input = {
      kb_layout = "us";
      #kb_variant = 
      #kb_model = 
      #lkb_options = 
      #kb_rules = 
      follow_mouse = 1;
      sensitivity = 0; # -1.0 - 1.0, 0 means no modification
      touchpad = {
        natural_scroll = true;
        tap-to-click = false;
      };
    };
    
    gestures = {
      workspace_swipe = true;
    };

    device = {
      name = "epic-mouse-v1";
      sensitivity = -0.5;
    };
  };
 };
}
