# modules/services/kavita.nix
{ ... }:
{
  services.kavita = {
    enable = true;
    port = 5000;
    dataDir = /kavita;
  };
}
