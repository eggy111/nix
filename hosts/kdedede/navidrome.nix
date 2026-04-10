{ ... }:
{
  services.navidrome = {
    enable = true;
    settings.MusicFolder = "/mnt/media/music";
    settings.Address = "0.0.0.0";
    group = "media";
    openFirewall = true;
  };
}
