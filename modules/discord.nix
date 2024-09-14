#discord.nix
#overlay for discord
{ config, pkgs, ... }:
{
   # Discord Overlay
   nixpkgs.overlays = [
  (_: prev: {
    discord = prev.discord.overrideAttrs (o: {
      nativeBuildInputs = o.nativeBuildInputs ++ [ prev.makeShellWrapper ];
      postInstall = (o.postInstall or "") + ''
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
}
