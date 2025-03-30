{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
let
  tubearchivistRedisConfig = config.services.redis.servers.tubearchivist;
in
{
  virtualisation = {
    containers.enable = true;
  };
}
