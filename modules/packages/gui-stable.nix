#gui.nix
{
        config,
        pkgs-stable,
        lib,
        inputs,
        ...
}:
{
        options = {
                custom.gui-stable.enable = lib.mkEnableOption "programs that you would use on a desktop";
        };

        config = lib.mkIf config.custom.gui-stable.enable {

                environment.systemPackages = with pkgs-stable; [
                        zotero
                ];
        };
}
