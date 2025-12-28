{ ... }:
{
  networking.firewall.allowedTCPPorts = [
    8084
  ];
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
