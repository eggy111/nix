# neovim.nix
# configuration for neovim
{ config, pkgs, ... }:
{
  programs.neovim = {
    defaultEditor = true;
  };
}
