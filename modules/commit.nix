# a module (? I think? can someone tell me if im wrong and/or explain what a module is like actually? ;_;) to commit to my gitea instance that I self host, which is then mirrored to github for posterity lol
# currently taken directly from this gist https://gist.github.com/0atman/1a5133b842f929ba4c1e195ee67599d5 than you 0atman not only for this but for putting me on nixos ^_^

{
  config,
  pkgs,
  options,
  ...
}: let
  hostname = "nix"; # to allow per-machine config, also i need to change my hostname but im a little nervous....
in {
  networking.hostName = hostname;

  imports = [
    /etc/nixos/hardware-configuration.nix # this might be bad for me given my configs, including hardware-configuration exist in ~/documents/nix/hosts/default/ but the hardware-configuration is a perfect copy so we shall see but I should put in my readme this could be an issue"
    (/home/eggy/Documents/nix/hosts/default/nixos-rebuild.sh + "/${hostname}.nix")
  ];
}
