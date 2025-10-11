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
    ./minecraft.nix
    ./niri.nix
    # ./neovim.nix
    ./nvim.nix
    ./packages.nix
    ./steam.nix
  ];
  custom.gui.enable = lib.mkDefault true;
  custom.hyprland.enable = lib.mkDefault true;
  custom.bluetooth.enable = lib.mkDefault true;
  custom.sops.enable = lib.mkDefault false;
  custom.minecraft.enable = lib.mkDefault false;

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/eggy/Documents/nix";
  };
}
