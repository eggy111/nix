{ ... }:
{
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      manager = {
        show_hidden = true;
        sort_reverse = true;
        sort_by = "mtime";
      };
    };
  };
}
