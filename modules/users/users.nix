{
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
                        "dialout"
                ];
                packages = with pkgs; [

                ];
        };
        users.users.test = {
                isNormalUser = true;
                extraGroups = [
                        "networkmanager"
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
                        "test" = import ../../hm/home.nix;
                };
        };
}
