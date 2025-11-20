# /hosts/framework/configuration.nix

{
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    # ./glance.nix
    # ./copyparty.nix
    # ./mpd.nix
  ];
  custom = {
    steam.enable = true;
    # framework.enable = true;
    discord.enable = true;
    zfs-dedede.enable = true;
    # minecraft.enable = true;
  };
  nix.settings.warn-dirty = false;
  hardware.sensor.iio.enable = true;

  # Bootloader.
  #boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # programs.niri.enable = true;
  networking.hostName = "chuchu"; # Define your hostname.
  networking.hostId = "c9305e0e";

  # Enable networking
  networking.networkmanager.enable = true;

  #security.pam.services.hyprlock = { };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  fonts.packages = with pkgs; [
    liberation_ttf
  ];
  fonts.enableDefaultPackages = true;
  environment.systemPackages = with pkgs; [
    liberation_ttf
    tlrc
    frogmouth
    anki
    # forge-mtg
    bagels
    pinta
    xournalpp
    squeekboard
    wvkbd
    inputs.iio-hyprland.packages.${pkgs.system}.default
    iio-sensor-proxy
  ];
  # virtualisation.waydroid.enable = true;

  # programs.zsh.enable = true; # enables zsh shell
  programs.fish.enable = true; # enables the fish shell

  programs.ladybird.enable = true;

  programs.firefox.enable = true; # Install Firefox

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  system.stateVersion = "24.05"; # Did you read the comment?

}
