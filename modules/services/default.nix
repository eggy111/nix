{ lib, ... }:
{
  imports = [
    ./homepage.nix
    ./immich.nix
    ./arr.nix
    ./sunshine.nix
  ];

  custom.homepage.enable = lib.mkDefault false;
  custom.immich.enable = lib.mkDefault false;
  custom.arr.enable = lib.mkDefault false;
  custom.sunshine.enable = lib.mkDefault false;
}
