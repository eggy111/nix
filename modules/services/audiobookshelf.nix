# modules/services/audiobookshelf.nix
{ ... }:

{
  services.audiobookshelf = {
    enable = true;
    port = 13378;
    dataDir = /audiobookshelf;
    openFirewall = false;
  };
}
