# hm/modules/default.nix
# barrel file for hm modules
{ lib, host, ... }:
{
  imports = [
    ../../hosts/${host}/home.nix
    ./hypr
    ./waybar
    ./nvim/nvim.nix
  ];
}
