#modules/packages/default.nix
{
  lib,
  ...
}:
{
  imports = [
    ./desktop.nix
    ./discord.nix
    ./gui.nix
    ./hyprland.nix
    ./neovim.nix
    ./packages.nix
    ./steam.nix
  ];
  custom.gui.enable = lib.mkDefault true;
  custom.hyprland.enable = lib.mkDefault true;
  custom.desktop.enable = lib.mkDefault false;
}
