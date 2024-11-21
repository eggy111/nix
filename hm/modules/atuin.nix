# hm/modules/atuin.nix
{ ... }:
{
  programs.atuin = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      # auto_sync = true;
      # sync_frequency = "5m";
      # sync_address = something;
      search_mode = "prefix";
    };
    flags = [ 
      "--disable-up-arrow"
    ];
  };
}
