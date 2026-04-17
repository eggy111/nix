# /hosts/kdedede/configuration.nix

{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    # ./freshrss.nix
    # ./containers.nix
    # ./nodecast.nix
    # ./netv.nix
    # ./immich.nix
    ./caddy.nix
  ];
  custom = {
    steam.enable = false;
    discord.enable = false;
    hyprland.enable = false;
    # kavita.enable = true;
    gui.enable = false;
    zfs-dedede.enable = true;
    immich.enable = false;
    arr.enable = true;
    plex.enable = true;
    sops.enable = true;
    navidrome.enable = true;
    copyparty.enable = true;
  };

  # Bootloader.
  boot.loader.efi.canTouchEfiVariables = true;
  services.smartd.enable = true;

  networking.hostName = "kdedede"; # Define your hostname.
  networking.hostId = "1585cc02";
  environment.systemPackages = with pkgs; [
    tmux
  ];

  # Enable networking
  networking.networkmanager.enable = true;

  programs.fish.enable = true;
  programs.firefox.enable = false;
  services.openssh.enable = true;
  services.printing.enable = false;

  system.stateVersion = "24.05"; # Did you read the comment?

}
