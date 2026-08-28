# /hosts/framework/configuration.nix

{
        pkgs,
        lib,
        inputs,
        ...
}:

{
        imports = [
                ./glance.nix
                #                ./copyparty.nix
                ./kiki.nix
        ];
        custom = {
                steam.enable = true;
                framework.enable = true;
                discord.enable = true;
                minecraft.enable = false;
                #                i2p.enable = false;
                bluetooth.enable = true;
        };
        nix.settings.warn-dirty = false;

        # Bootloader.
        boot.loader.systemd-boot.enable = true;
        boot.loader.efi.canTouchEfiVariables = true;

        # programs.niri.enable = true;
        networking.hostName = "framework"; # Define your hostname.

        # Enable networking
        networking.networkmanager.enable = true;

        #security.pam.services.hyprlock = { };

        # Enable CUPS to print documents.
        services.printing.enable = true;

        security.wrappers.Hyprland.enable = lib.mkForce false; # temp fix bc hyprland is being annoying and only office wont launch

        fonts.packages = with pkgs; [
                liberation_ttf_v1
        ];
        environment.systemPackages = with pkgs; [
                liberation_ttf_v1
                tlrc
                frogmouth
                anki
                forge-mtg
                pinta
                # quickshell
                # inputs.meowdo.packages.${pkgs.stdenv.hostPlatform.system}.default
        ];
        virtualisation.waydroid.enable = true;

        # programs.zsh.enable = true; # enables zsh shell
        programs.fish.enable = true; # enables the fish shell

        programs.ladybird.enable = false;

        programs.firefox.enable = true; # Install Firefox

        # Enable the OpenSSH daemon.
        services.openssh.enable = true;

        system.stateVersion = "24.05"; # Did you read the comment?

}
