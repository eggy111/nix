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
    qalculate-qt # calculator
    doxx
    xleak

    #misc
    zint # qr code generator
    procps # Utilities that give information about processes using the /proc filesystem
    texliveTeTeX # for pandoc i think
    gnumake # make tool
    libgcc # make tool (I think)
    whois # tool for whois lookup

    #shell related packages
    fish # shell
    starship # a sort of theme manager similiar to powerlevel10k
    kitty

    #file manager and related
    yazi # file manager
    # lf # file manager but i dont want it anymore, lf is aliased to yazi
    ncdu # tui tool for viewing and interacting with disk space
    wiper # Disk analyser and cleanup tool
    tree # nice way to view directory structure
    smartmontools

    #terminal applications
    git # version control
    lazygit
    fzf # fuzzy finder
    # frogmouth # i think this is a markdown viewer
    nixfmt-rfc-style # nix formatter or smthn
    nixd # i think nix lsp
    unar # archiver
    unzip # zipper
    bat # cat but better (cat is aliased to bat)
    neofetch # system info, but deprecated
    fastfetch # newer neofetch
    wget # download
    vim # text editor
    eza # nicer ls but I don't use it enough
    neovim # text editor but better
    zip # zipping tool
    yt-dlp # video download
    pandoc # document conversion (having troubles with it)

    #file transfer things
    wireguard-tools # vpn manager
    #localsend # a tool to send files locally similiar to airdrop
    # termscp # transfer manager
    sshfs # mounts file directory using ssh
    croc # file transfers

  ];
}
