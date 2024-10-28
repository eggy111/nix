#bluetooth.nix
# set up bluetooth

{ config, pkgs, ... }:

{
  #enable bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  services.blueman.enable = true;
}
