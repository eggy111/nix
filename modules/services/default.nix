{ lib, ... }:
{
  imports = [
    ./dashy.nix
  ];

  custom.dashy.nix = lib.mkDefault true;
}
