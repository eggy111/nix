#modules/systems/default.nix
{
  lib,
  ...
}:
{
  imports = [
    ./framework.nix
    ./nvidia.nix
    ./zfs-dedede.nix
    ./zfs-chuchu.nix
    # ./blade_zfs.nix
  ];

  custom.framework.enable = lib.mkDefault false;
  custom.nvidia.enable = lib.mkDefault false;
  custom.zfs-dedede.enable = lib.mkDefault false;
  custom.zfs-chuchu.enable = lib.mkDefault false;
  # custom.zfs-blade = lib.mkDefault false;
}
