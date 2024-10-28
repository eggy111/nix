#discord.nix
#overlay for discord
{
  config,
  pkgs,
  lib,
  ...
}:
{

  options = {
    custom.discord.enable = lib.mkEnableOption "enables discord support, with overlays";
  };
  config = lib.mkIf config.custom.discord.enable {
    environment.systemPackages = with pkgs; [
      discord
    ];

    # Discord Overlay
    nixpkgs.overlays = [
      (_: prev: {
        discord = prev.discord.overrideAttrs (o: {
          nativeBuildInputs = o.nativeBuildInputs ++ [ prev.makeShellWrapper ];
          postInstall =
            (o.postInstall or "")
            + ''
              wrapProgramShell $out/opt/Discord/Discord \
                --add-flags " \
                  --disable-gpu-sandbox \ 
                  --enable-accelerated-mjpeg-decode \
                  --enable-accelerated-video \
                  --enable-features=VaapiVideoDecoder \
                  --enable-gpu-rasterization \
                  --enable-native-gpu-memory-buffers \
                  --enable-zero-copy \
                  --ignore-gpu-blocklist \ 
                  --use-gl=desktop \
              "
            '';
        });
      })
    ];
  };
}
