{ lib, ... }:
{
  imports = [
    ./copyparty.nix
    ./homepage.nix
    ./immich.nix
    ./i2p.nix
    ./kavita.nix
    ./arr.nix
    ./sunshine.nix
    ./plex.nix
    ./navidrome.nix
  ];

  custom.copyparty.enable = lib.mkDefault false;
  custom.homepage.enable = lib.mkDefault false;
  custom.immich.enable = lib.mkDefault false;
  custom.i2p.enable = lib.mkDefault false;
  custom.kavita.enable = lib.mkDefault false;
  custom.arr.enable = lib.mkDefault false;
  custom.sunshine.enable = lib.mkDefault false;
  custom.plex.enable = lib.mkDefault false;
  custom.navidrome.enable = lib.mkDefault false;
}
