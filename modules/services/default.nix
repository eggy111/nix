{ lib, ... }:
{
  imports = [
    ./homepage.nix
  ];

  custom.homepage.enable = lib.mkDefault false;
}
