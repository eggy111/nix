#graphics.nix
# various graphical settings that i generally always want on

{config, pkgs, ...}:

{
 xdg.portal = {
   enable = true;
   #wlr.enable = true;
   #config.common.default = "*";
   extraPortals = [
   pkgs.xdg-desktop-portal-gtk
   ];
 };

 programs.hyprland = {
  enable = true;
  #paclage = inputs.hyprland.packages.${pkgs.system}.hyprland;
 };
 
 hardware.graphics = {
   enable = true;
   enable32Bit = true;
 };

 #Enable the X11 windowing system.
 #services.xserver.enable = true;

 #Enable GNOME Desktop Environment
 #services.xserver.displayManager.gdm.enable = true;
 #services.xserver.desktopManager.gnome.enable = true;
}
