# config for oh-my-zsh

{config, pkgs, ... }:
{
 programs.zsh.ohMyZsh = {
    enable = true;
    plugins = [ "git" "autojump" "colored-man-pages" "colorize" "command-not-found" "common-aliases" "copy-buffer" "emoji" "fzf" "kitty" ];
    theme = "powerlevel10k/powerlevel10k";
     };
 }
  
