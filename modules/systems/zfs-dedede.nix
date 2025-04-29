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
    };
    boot.zfs = {
      requestEncryptionCredentials = true;
      extraPools = [ "rpool" ];
    };
  };
}
