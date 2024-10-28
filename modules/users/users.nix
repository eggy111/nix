{
  config,
  pkgs,
  inputs,
  ...
}:

{
  users.users.eggy = {
    isNormalUser = true;
    #description = "eggy";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [

    ];
  };

  home-manager = {
    #also pass inputs to home-manager modules
    extraSpecialArgs = {
      inherit inputs;
    };
    users = {
      "eggy" = import ../../hm/home.nix;
    };
  };
}
