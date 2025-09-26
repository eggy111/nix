{ ... }:
{
  services.tt-rss = {
    enable = true;
    # to configure a nginx virtual host directly:
    virtualHost = "tt-rss.example.com";
    selfUrlPath = "https://tt-rss.example.com";
  };
}
