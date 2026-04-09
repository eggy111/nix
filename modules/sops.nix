# sops.nix
{
  inputs,
  lib,
  config,
  ...
}:

{
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];
  options = {
    custom.sops.enable = lib.mkEnableOption "tired of error and i havent figured it out, or needed to so";
  };

  config = lib.mkIf config.custom.sops.enable {

    sops.defaultSopsFile = ../secrets/secrets.yaml;
    sops.defaultSopsFormat = "yaml";

    sops.age.keyFile = "/etc/ssh/ssh_host_ed25519_key";

    sops.secrets.example-key = { };
    sops.secrets."myservice/my_subdir/my_secret" = {
      owner = "sometestservice";
    };
    sops.secrets.copyparty_password = {
      owner = "copyparty";
      group = "copyparty";
    };

    systemd.services."sometestservice" = {
      script = ''
        echo "
        Secret password: 
        $(cat ${config.sops.secrets."myservice/my_subdir/my_secret".path})
        Located in: 
        ${config.sops.secrets."myservice/my_subdir/my_secret".path}
        sending to database lol
        " > /var/lib/sometestservice/testfile
      '';
      serviceConfig = {
        User = "sometestservice";
        WorkingDirectory = "/var/lib/sometestservice";
      };
    };

    users.users.sometestservice = {
      home = "/var/lib/sometestservice";
      createHome = true;
      isSystemUser = true;
      group = "sometestservice";
    };
    users.groups.sometestservice = { };
  };
}
