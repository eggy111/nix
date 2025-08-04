{ inputs, pkgs, ... }:
{
  services.copyparty = {
    enable = true;
    settings = {
      i = "0.0.0.0";
      p = [
        3210
        3211
      ];
      no-reload = true;
      ignored-flag = false;
    };
    accounts = {
      eggy.passwordFile = "/run/keys/copyparty/eggy_test_key";
    };
    volumes = {
      "/" = {
        path = "/srv/copyparty"; # copyparty must be the owner of the folder
        access = {
          rw = [ "eggy" ];
        };
        flags = {
          # enables filekeys
          fk = 4;
          # scan for new files every 60s
          scan = 60;
          # enables the uploads database
          e2d = true;
          # disables multimedia parsers
          d2t = true;
          # skips hashing the file if it ends in .iso
          nohash = "\.iso$";
        };
      };
    };
    openFilesLimit = 8192;
  };

}
