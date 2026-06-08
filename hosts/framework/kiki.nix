{
  config,
  lib,
  pkgs,
  ...
}:

{
  # PHP-FPM with mbstring
  services.phpfpm.pools.kiki = {
    user = "nginx";
    group = "nginx";
    settings = {
      "listen.owner" = "nginx";
      "listen.group" = "nginx";
      "pm" = "dynamic";
      "pm.max_children" = 10;
      "pm.start_servers" = 2;
      "pm.min_spare_servers" = 1;
      "pm.max_spare_servers" = 5;
    };
    phpPackage = pkgs.php.withExtensions ({ enabled, all }: enabled ++ [ all.mbstring ]);
  };

  environment.systemPackages = with pkgs; [ php ];

  services.nginx = {
    enable = true;
    virtualHosts."kiki.local" = {
      root = "/var/www/kiki/generated";
      locations."/" = {
        index = "home.html";
        tryFiles = "$uri $uri/ =404";
      };
    };
  };

  # Make sure /var/www/kiki exists and nginx can read it
  systemd.tmpfiles.rules = [
    "d /var/www/kiki 0755 nginx nginx -"
  ];
}
