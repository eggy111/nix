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
                boot = {
                        supportedFilesystems.zfs = true;
                        zfs = {
                                forceImportRoot = false;
                                devNodes = "/dev/disk/by-id";
                                extraPools = [
                                        "zroot"
                                        "zstore"
                                ];
                                requestEncryptionCredentials = true;
                        };
                        loader.grub = {
                                enable = true;
                                efiSupport = true;
                                zfsSupport = true;
                                device = "nodev";
                        };
                };
                services.zfs = {
                        autoScrub.enable = true;
                        trim.enable = true;
                };
                swapDevices = [ { device = "/dev/disk/by-label/SWAP"; } ];

                fileSystems = {
                        "/" = {
                                device = "zroot/root";
                                fsType = "zfs";
                                neededForBoot = true;
                        };
                        "/boot" = {
                                device = "/dev/disk/by-label/NIXBOOT";
                                fsType = "vfat";
                        };
                        "/nix" = {
                                device = "zroot/nix";
                                fsType = "zfs";
                        };
                        "/tmp" = {
                                device = "zroot/tmp";
                                fsType = "zfs";
                        };
                        "/persist" = {
                                device = "zroot/persist";
                                fsType = "zfs";
                                neededForBoot = true;
                        };
                        "/cache" = {
                                device = "zroot/cache";
                                fsType = "zfs";
                                neededForBoot = true;
                        };

                        # zstore datasets options = [ "nofail" ]; allows it to boot if these drives fail

                        "/mnt/media" = {
                                device = "zstore/media";
                                fsType = "zfs";
                                options = [ "nofail" ];
                        };
                        "/mnt/media/downloads" = {
                                device = "zstore/media/downloads";
                                fsType = "zfs";
                                options = [ "nofail" ];
                        };
                        "/mnt/media/movies" = {
                                device = "zstore/media/movies";
                                fsType = "zfs";
                                options = [ "nofail" ];
                        };
                        "/mnt/media/tv" = {
                                device = "zstore/media/tv";
                                fsType = "zfs";
                                options = [ "nofail" ];
                        };
                        "/mnt/apps" = {
                                device = "zstore/apps";
                                fsType = "zfs";
                                options = [ "nofail" ];
                        };
                        "/mnt/storage" = {
                                device = "zstore/storage";
                                fsType = "zfs";
                                options = [ "nofail" ];
                        };
                };
        };
}
