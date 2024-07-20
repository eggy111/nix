# config for oh-my-zsh

{lib, config, pkgs, ... };

 {
  programs.zsh.ohmyzsh = {
    enable = true;
    plugins = [ "git" "autojump" "colored-man-pages" "colorize" "command-not-foudn" "common-aliases" "copy-buffer" "emoji" "fzf" "kitty" ];
    theme = "powerlevel10k/powerlevel10k"
  };
};
