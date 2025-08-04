# /hosts/framework/configuration.nix

{
  pkgs,
  ...
}:

{
  imports = [
    ./glance.nix
    # ./copyparty.nix
  ];
  custom = {
    steam.enable = true;
    framework.enable = true;
    discord.enable = true;
    minecraft.enable = true;
  };
  nix.settings.warn-dirty = false;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "framework"; # Define your hostname.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  #security.pam.services.hyprlock = { };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  fonts.packages = with pkgs; [
    liberation_ttf_v1
  ];
  environment.systemPackages = with pkgs; [
    liberation_ttf_v1
    tlrc
    frogmouth
  ];

  # programs.zsh.enable = true; # enables zsh shell
  programs.fish.enable = true; # enables the fish shell

  programs.ladybird.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

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

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
