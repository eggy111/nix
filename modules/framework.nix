#framework.nix
# various configurations to make framework laptop work nicely
{ config, pkgs, lib, ... }:
{
 

 options = {
   custom.framework.enable =
     lib.mkEnableOption "enables framework config";
 };
 config = lib.mkIf config.custom.framework.enable {
    services.fwupd.enable = true;
    # we need fwupd 1.9.7 to downgrade the fingerprint sensor firmware
     services.fwupd.package = (import (builtins.fetchTarball {
       url = "https://github.com/NixOS/nixpkgs/archive/bb2009ca185d97813e75736c2b8d1d8bb81bde05.tar.gz";
       sha256 = "sha256:003qcrsq5g5lggfrpq31gcvj82lb065xvr7bpfa8ddsw8x4dnysk";
     }) {
       inherit (pkgs) system;
     }).fwupd;
  };
}

