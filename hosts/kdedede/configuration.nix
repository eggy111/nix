# /hosts/kdedede/configuration.nix

{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./freshrss.nix
    # ./copyparty.nix
    ./containers.nix
    # ./nodecast.nix
    # ./netv.nix
    ./immich.nix
  ];
  custom = {
    steam.enable = false;
    discord.enable = false;
    hyprland.enable = false;
    gui.enable = false;
    zfs-dedede.enable = true;
    immich.enable = false;
  };

  # Bootloader.
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "kdedede"; # Define your hostname.
  networking.hostId = "1585cc02";

  # Enable networking
  networking.networkmanager.enable = true;

  programs.fish.enable = true;
  programs.firefox.enable = false;
  services.openssh.enable = true;
  services.printing.enable = false;

  system.activationScripts.vaultPermissions = {
    text = ''
      chown -R eggy:users /vault
      chmod -R 775 /vault
    '';
  };
  system.stateVersion = "24.05"; # Did you read the comment?

}
