{
  lib,
  ...
}:

{
  options = {
    custom.zfs-dedede.enable = lib.mkEnableOption "configures zfs pool for my server";
  };
  boot.supportedFilesystems.zfs = true;

  config = {
    services.zfs = {
      enable = true;
      autoScrub.enable = true;
      autoScrub.interval = "weekly";
    };

    boot.zfs.pools = {
      "mypool" = {
        devices = [
          {
            vdev = "raidz2";
            devices = [
              "dev/disk/by-id/xxxx"
            ];
          }
        ];
      };
    };
  };

}
