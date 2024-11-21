#bluetooth.nix
# set up bluetooth

{ ... }:

{
  #enable bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  }; # this block enables bluetooth, and has it startup when I boot

  services.blueman.enable = true; # blueman helps manage bluetooth devices
}
