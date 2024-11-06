{
  lib,
  ...
}:

{
  options = {
    custom.zfs-blade.enable = lib.mkEnableOption "configures zfs pool for blade server";
  };

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
            vdev = "mirror";
            devices = [
              "dev/disk/by-id/xxxx"
            ];
          }
          # # SLOG (mirrored NVMes for the log devices)
          # {
          #   vdev = "log";
          #   devices = [
          #     {
          #       vdev = "mirror";
          #       devices = [
          #         "/dev/disk/by-id/nvme-xxx"
          #       ];
          #     }
          #   ];
          # }
          # # L2ARC (read cache)
          # {
          #   vdev = "cache";
          #   devices = [ "/dev/disk/by-id/nvme-xxx" ];
          # }
        ];
      };
    };
  };

}
