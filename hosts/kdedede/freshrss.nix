{ ... }:
{
  services.freshrss = {
    enable = true;
    passwordFile = "/run/secrets/freshrss";
    baseUrl = "0.0.0.0";

  };
}
