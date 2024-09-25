# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix

      # various modules which could be included in my configuration, but I modularized it for clarity
      ../../modules/bluetooth.nix
      ../../modules/discord.nix
      ../../modules/fonts.nix
      ../../modules/framework.nix
      ../../modules/locale.nix
      ../../modules/main-user.nix
      ../../modules/neovim.nix
      ../../modules/nvidia.nix
      ../../modules/packages.nix
      ../../modules/pipewire.nix
      ../../modules/steam.nix
      inputs.home-manager.nixosModules.home-manager
    ];

  steam.enable = true;
  nvidia.enable = false;

  main-user.enable = true;
  main-user.userName = "eggy";

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "framework"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  #This enables support for flakes, and maybe also home-manager
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  xdg.portal = {
   enable = true;
   #wlr.enable = true
   # config.common.default = "*";
   extraPortals = [
   pkgs.xdg-desktop-portal-gtk
   ];
 };
 
 # Various config options to enable various graphical uis.  At this point I am using hyprland
 programs.hyprland = {
  enable = true;
  package = inputs.hyprland.packages.${pkgs.system}.hyprland;
 }; 

 hardware.graphics = {
   enable = true;
   enable32Bit = true;
 };

  # Enable the X11 windowing system.
 # services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
 # services.xserver.displayManager.gdm.enable = true;
 # services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "us";
    xkb.variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

#  Enable zsh
#  programs.zsh.enable = true;

#  Enable Fish
   programs.fish.enable = true;
 
    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.eggy = {
    isNormalUser = true;
    #description = "eggy";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };
  
  home-manager = {
    # also pass inputs to home-manger modules.
    extraSpecialArgs = { inherit inputs; };
    users = {
      "eggy" = import ../../hm/home.nix;
    };
  };
  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

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
