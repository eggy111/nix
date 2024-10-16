# hm/modules/default.nix
# barrel file for hm modules
{ lib, ... }:
{
  imports = [
    ./hyprland.nix
    ./hyprlock.nix
    ./hypridle.nix
  ];
}
