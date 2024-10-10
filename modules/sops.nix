# sops.nix
{ pkgs, inputs, config, ... }:

{
  imports = 
    [
      inputs.sops-nix.nixosModules.sops
    ];

  sops.defaultSopsFile = ../secrets/secrets.yaml;
  sops.defaultSopsFormat = "yaml";

  sops.age.keyFile = "/home/eggy/.config/sops/age/key.txt";

  sops.secrets.example-key = { };
  sops.secrets."myservice/my_sudir/my_secret" = { };
}
