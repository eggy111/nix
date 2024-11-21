# sops.nix
{
  inputs,
  config,
  ...
}:

{
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];

  sops.defaultSopsFile = ../secrets/secrets.yaml;
  sops.defaultSopsFormat = "yaml";

  sops.age.keyFile = "/home/eggy/.config/sops/age/keys.txt";

  sops.secrets.example-key = { };
  sops.secrets."myservice/my_subdir/my_secret" = {
    owner = "sometestservice";
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
}
