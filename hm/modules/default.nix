# hm/modules/default.nix
# barrel file for hm modules
{ host, ... }:
{
  imports = [
    ../../hosts/${host}/home.nix
    ./atuin.nix
    ./dunst.nix
    ./hypr
    ./nvim/nvim.nix
    ./waybar
  ];
}
