{ lib, ... }:
{
  imports = [
    ./homepage.nix
    ./immich.nix
    ./arr.nix
    ./sunshine.nix
    ./plex.nix
    ./navidrome.nix
  ];

  custom.homepage.enable = lib.mkDefault false;
  custom.immich.enable = lib.mkDefault false;
  custom.arr.enable = lib.mkDefault false;
  custom.sunshine.enable = lib.mkDefault false;
  custom.plex.enable = lib.mkDefault false;
  custom.navidrome.enable = lib.mkDefault false;
}
