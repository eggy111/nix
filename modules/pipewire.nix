# pipewire.nix
# used for configuring sound

{config, pkgs, ... }:
#enable sound with pipewire
{
 hardware.pulseaudio.enable = false;
 security.rtkit.enable = true;
 services.pipewire = {
   enable = true;
   alsa.enable = true;
   pulse.enable = true;
   # If you want to use JACK applications, uncomments this
   #jack.enable = true;
 };
}
