#modules/systems/default.nix
{
  lib,
  ...
}:
{
  imports = [
    ./framework.nix
    ./nvidia.nix
    # ./dedede_zfs.nix
    # ./blade_zfs.nix
  ];

  custom.framework.enable = lib.mkDefault false;
  custom.nvidia.enable = lib.mkDefault false;
  # custom.zfs-dedede = lib.mkDefault false;
  # custom.zfs-blade = lib.mkDefault false;
}