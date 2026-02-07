{ pkgs, ... }:
{
  networking.firewall.allowedTCPPorts = [
    8084
    8000
  ];
  environment.systemPackages = with pkgs; [ podman-compose ];
  virtualisation = {
    containers.enable = true;
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };
  };
  users.users.eggy = {
    extraGroups = [
      "podman"
    ];
  };
}
