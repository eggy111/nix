# hyprlock.nix
# an hm module
{ lib, config, ... }:
{
 programs.hyprlock = {
   enable = true;
   
   settings = {
     source = "/home/eggy/hypr/colors.conf";
     general = {
       ignore_empty_input = true;
       grace = 120;
     };

     background = [
       {
        path = "/home/eggy/.config/wallpapers/A.png";
        blur_passes = 2;
        blur_size = 5;
        vibrance = 0.1696;
        brightness = 0.5;
       }
     ];

     label = [
      {
       # TIME
       monitor = "";
       text = ''cmd[update:1000] echo "$(date +"%R")"'';
       color = "$foreground";
       font_size = 100;
       font_family = "JetBrainsMono Nerd Font ExtraBold";
       position = "0, 300";
       halign = "center";
       valign = "center";
      }
      {
       # DATE
       monitor = "";
       text = ''cmd[update:1000] echo "$(date +"%a, %d %b")"'';
       color = "$foreground";
       font_size = 22;
       font_family = "JetBrainsMono Nerd Font Bold";
       position = "0, 200";
       halign = "center";
       valign = "center";
      }
      {
       # UPTIME
       monitor = "";
       text = ''cmd[update:1000] echo "Up $(uptime -p | sed "s/up \(.*\)/\1/")"'';
       color = "$foreground";
       font_size = 14;
       font_family = "JetBrainsMono Nerd Font";
       position = "0, -500";
       halign = "center";
       valign = "center";
      }
     ];
     
     input-field = [
       {
        size = "250, 50";
        outline_thickness = 2;
        dots_size = 0.28;
        dots_spacing = 0.15;
        dots_center = true;
        dots_rounding = -1; 
        outer_color = "$foreground";
        inner_color = "$background";
        font_color = "$foreground";
        fade_on_empty = true;
        fade_timeout = 1500;
        font_family = "JetBrainsMono Nerd Font Bold";
        placeholder_text = "<i>Enter Password...</i>";
        hide_input = false;
        rounding = 20;
        check_color = "$color2";
        fail_color = "rgb(204, 34, 34)";
        fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
        fail_timeout = 2000;
        fail_transition = 200;
       }
     ];
   };
 };
}
