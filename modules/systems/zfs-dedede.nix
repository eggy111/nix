{
  lib,
  config,

  ...
}:

{
  options = {
    custom.zfs-dedede.enable = lib.mkEnableOption "configures zfs pool for my server";
  };
  config = lib.mkIf config.custom.zfs-dedede.enable {
    boot.supportedFilesystems.zfs = true;

    config = {
      services.zfs = {
        enable = true;
        autoScrub.enable = true;
        autoScrub.interval = "weekly";
      };
      # boot.zfs.extraPools = [ "mypool" ];

      # boot.zfs.pools = {
      #   "mypool" = {
      #     devices = [
      #       {
      #         vdev = "raidz2";
      #         devices = [
      #           "dev/disk/by-id/xxxx"
      #         ];
      #       }
      #     ];
      #   };
      # };
    };
  };
}
