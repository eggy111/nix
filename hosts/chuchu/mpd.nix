{ pkgs, ... }:
{
  services.mpd = {
    enable = true;
    musicDirectory = "/home/eggy/Music";
    extraConfig = ''
                        auto_update "yes"
                        restore_paused "yes"
      audio_output {
      type "pulse"
      name "pulse"
      server "127.0.0.1"
      }
    '';
  };
  hardware.pulseaudio.extraConfig = "load-module module-native-protocol-tcp auth-ip-acl=127.0.0.1";
  environment.systemPackages = with pkgs; [
    mpc
  ];
}
