{ inputs, pkgs, ... }:
{
  nixpkgs.overlays = [ niri.overlays.niri ];
  programs.niri = {
    enable = true;
  };
}
