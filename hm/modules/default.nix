# hm/modules/default.nix
# barrel file for hm modules
{ lib, ... }:
{
  imports = [
    ./hypr
    ./waybar
    ./nvim/nvim.nix
  ];
}
