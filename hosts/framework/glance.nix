{ ... }:
{
  services.glance = {
    enable = true;
    settings = {
      theme = {
        background-color = "240 21 15";
        contrast-multiplier = 1.2;
        primary-color = "222 92 83";
        positive-color = "115 54 76";
        negative-color = "347 70 65";
      };
      pages = [
        {
          name = "home";
          columns = [
            {
              size = "small";
              widgets = [
                {
                  type = "calendar";
                }
                {
                  location = "Okemos, Michigan, United States";
                  type = "weather";
                  units = "imperial";
                }
              ];
            }
            {
              size = "full";
              widgets = [
                {
                  type = "hacker-news";
                }
                {
                  type = "group";
                  widgets = [
                    {
                      type = "reddit";
                      subreddit = "selfhosted";
                      show-thumbnails = true;
                      collapse-after = 6;
                    }
                    {
                      type = "reddit";
                      subreddit = "piracy";
                      show-thumbnails = true;
                      collapse-after = 6;
                    }
                  ];
                }
              ];
            }
            {
              size = "small";
              widgets = [
                {
                  type = "releases";
                  show-source-icon = true;
                  repositories = [
                    "tesscoleman/michigan-bryophytes"
                    "NotAShelf/nvf"
                    "hyprwm/Hyprland"
                    "hyprland-community/pyprland"
                    "iynaix/focal"
                    "LadybirdBrowser/ladybird"
                  ];
                }
                # {
                # type = "repository";
                # repository = ;
                # }
              ];
            }
          ];
        }
      ];
    };
  };
}
