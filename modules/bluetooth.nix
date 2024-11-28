#bluetooth.nix
# set up bluetooth

{ lib, config, ... }:

{
  options = {
    custom.bluetooth.enable = lib.mkEnableOption "whether sysytem has bluetooth";
  };

  config = lib.mkIf config.custom.bluetooth.enable {
    #enable bluetooth
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
    }; # this block enables bluetooth, and has it startup when I boot

    services.blueman.enable = true; # blueman helps manage bluetooth devices
  };

}
