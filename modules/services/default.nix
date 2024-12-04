{ lib, ... }:
{
  imports = [
    ./dashy.nix
  ];

  custom.dashy.enable = lib.mkDefault true;
}
