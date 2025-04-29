#modules/packages/default.nix
{
  lib,
  ...
}:
{
  imports = [
    ./discord.nix
    ./gui.nix
    ./hyprland.nix
    # ./neovim.nix
    ./nvim.nix
    ./packages.nix
    ./steam.nix
  ];
  custom.gui.enable = lib.mkDefault true;
  custom.hyprland.enable = lib.mkDefault true;
  custom.bluetooth.enable = lib.mkDefault true;
  custom.sops.enable = lib.mkDefault false;
  custom.minecraft = lib.mkDefault false;
}
