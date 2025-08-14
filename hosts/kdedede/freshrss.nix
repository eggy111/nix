{ ... }:
{
  services.freshrss = {
    enable = true;
    passwordFile = "/run/secrets/freshrss";
    baseUrl = "git.eggy.lol";

  };
}
