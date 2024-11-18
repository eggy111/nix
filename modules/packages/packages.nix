# packages.nix
# install system packages here
{
  # config,
  pkgs,
  # inputs,
  ...
}:
{

  programs.localsend.enable = true;

  environment.systemPackages = with pkgs; [
    qt6Packages.qwlroots # what is this package bruh
    #mpv

    #productivity related goods
    qalculate-qt

    #misc
    zint
    procps # Utilities that give information about processes using the /proc filesystem
    texliveTeTeX
    gnumake
    libgcc
    whois

    #shell related packages
    fish
    starship

    #file manager and related
    yazi
    lf
    ncdu
    tree

    #terminal applications
    git
    fzf
    frogmouth
    nixfmt-rfc-style
    nixd
    unar
    unzip
    bat
    neofetch
    fastfetch
    wget
    vim
    eza
    neovim
    zip
    yt-dlp
    pandoc

    #file transfer things
    wireguard-tools
    #localsend
    # termscp
    sshfs

  ];
}
