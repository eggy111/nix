{ config, pkgs, lib, ... }:

{
  imports = 
   [
    ./hyprland.nix
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
    #hyprland config files
#    ".config/hypr/hyprland.conf".source = ./hypr/hyprland.conf;
#    ".config/hypr/hypridle.conf".source = ./hypr/hypridle.conf;
#    ".config/hypr/colors.conf".source = ./hypr/colors.conf;
#    ".config/hypr/hyprlock.conf".source = ./hypr/hyprlock.conf;
#    ".config/hypr/new_wallpaper.sh".source = ./hypr/new_wallpaper.sh;
#    ".config/hypr/start.sh".source = ./hypr/start.sh;
#    ".config/hypr/wallpaper.sh".source = ./hypr/wallpaper.sh;

    #wallpapers im sure there is a better way to do this.... but im lazy r
#    ".config/wallpapers/1.png".source = ./wallpapers/1.png;
#    ".config/wallpapers/2.png".source = ./wallpapers/2.png;
#    ".config/wallpapers/3.png".source = ./wallpapers/3.png;
#    ".config/wallpapers/4.png".source = ./wallpapers/4.png;
#    ".config/wallpapers/5.png".source = ./wallpapers/5.png;
#    ".config/wallpapers/6.png".source = ./wallpapers/6.png;
#    ".config/wallpapers/7.png".source = ./wallpapers/7.png;
#    ".config/wallpapers/8.png".source = ./wallpapers/8.png;
#    ".config/wallpapers/9.png".source = ./wallpapers/9.png;
#    ".config/wallpapers/10.png".source = ./wallpapers/10.png;
#    ".config/wallpapers/11.png".source = ./wallpapers/11.png;
#    ".config/wallpapers/12.png".source = ./wallpapers/12.png;
#    ".config/wallpapers/13.png".source = ./wallpapers/13.png;
#    ".config/wallpapers/14.png".source = ./wallpapers/14.png;
#    ".config/wallpapers/15.png".source = ./wallpapers/15.png;
#    ".config/wallpapers/16.png".source = ./wallpapers/16.png;
#    ".config/wallpapers/17.png".source = ./wallpapers/17.png;
#    ".config/wallpapers/18.png".source = ./wallpapers/18.png;
#    ".config/wallpapers/19.png".source = ./wallpapers/19.png;
#    ".config/wallpapers/20.png".source = ./wallpapers/20.png;
#    ".config/wallpapers/21.png".source = ./wallpapers/21.png;
#    ".config/wallpapers/22.png".source = ./wallpapers/22.png;
#    ".config/wallpapers/23.png".source = ./wallpapers/23.png;
#    ".config/wallpapers/24.png".source = ./wallpapers/24.png;
#    ".config/wallpapers/A.png".source = ./wallpapers/A.png;
#    ".config/wallpapers/B.png".source = ./wallpapers/B.png;
#    ".config/wallpapers/C.png".source = ./wallpapers/C.png;
#    ".config/wallpapers/jerma_nichijou.gif".source = ./wallpapers/jerma_nichijou.gif;

 #   #waybar config
 #   ".config/waybar/config".source = ./waybar/config;
 #   ".config/waybar/style.css".source = ./waybar/style.css;
    
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
     EDITOR = "vim";
     XCURSOR_SIZE = config.home.pointerCursor.size;
  };
  
  programs.kitty = { 
    settings = {
      shell = lib.getExe pkgs.fish;
    };
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
     packages = "vim /home/eggy/Documents/nix/modules/packages.nix";
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
