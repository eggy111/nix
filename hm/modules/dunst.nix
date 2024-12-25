# hm/modules/dunst.nix
{ pkgs, ... }:
{
  services.dunst = {
    enable = true;
    iconTheme = {
      name = "Adwaita";
      size = "32x32";
      package = pkgs.adwaita-icon-theme;
    };
  };
}
