{ config, pkgs, lib, ... }:

{
  imports = 
   [
    ./modules
   ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "eggy";
  home.homeDirectory = "/home/eggy";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
    btop

    # nix related
    nix-output-monitor # provides the command nom that function like nix, btu makes it nicer
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;
     ".config/hypr/pyprland.toml".source = ./modules/pyprland.toml;
     ".config/waybar/style.css".source = ./modules/waybar/style.css;
     ".config/rofimoji.rc".source = ./rofimoji.rc;

    
    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
    
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/eggy/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
     EDITOR = "nvim";
     XCURSOR_SIZE = config.home.pointerCursor.size;
  };

  services.kdeconnect = {
    enable = true;
    indicator = true;
  };

  programs.kitty = { 
    settings = {
      shell = lib.getExe pkgs.fish;
    };
    themeFile = "Eldritch";
  };
  
  programs.fish = { 
    enable = true;
    shellAliases = lib.mkForce { };
    shellAbbrs = config.home.shellAliases;
          # fix starship prompt to only have newlines after the first command
      # https://github.com/starship/starship/issues/560#issuecomment-1465630645
      shellInit = ''
        function postexec_newline --on-event fish_postexec
          echo ""
        end
      '';
      # add transient prompt for fish via transient.fish plugin in fish.nix
      # the starship transience module doesn't handle empty commands properly
      interactiveShellInit = lib.mkAfter ''
        function transient_prompt_func
          starship module character
        end
      '';
    
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  # configuration written to ~/.config/starship.toml for now
    enableTransience = true;
#    settings =
#      {
#      add_newline = false;
#
#    };
  };

  home ={
    shellAliases = { 
     rs = "sudo nixos-rebuild switch --flake ~/Documents/nix/";
     cat = "bat";
     lock = "hyprlock";
     packages = "vim /home/eggy/Documents/nix/modules/packages/packages.nix";
     cn = "cd /home/eggy/Documents/nix";
     rt = "sudo nixos-rebuild test --flake ~/Documents/nix/";
     hyprland = "Hyprland";
         };
    pointerCursor = {
      package = pkgs.simp1e-cursors;
      name = "Simp1e-Catppuccin-Frappe";
      size = 28;
      gtk.enable = true;
      x11.enable = true;
    };

   };

 # programs.zsh = {
 #  enable = true;
 #  shellAliases = {
 #   nrs = "sudo nixos-rebuild switch --flake /home/eggy/Documents/nix";
 #  };
 #  zplug = {
 #    enable = true;
 #    plugins = [
 #      { name = "zsh-users/zsh-autosuggestions"; }
 #      { name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ]; }
 #    ];
 #  };
 # };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
