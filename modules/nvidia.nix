{ config, pkgs, lib, ... }:

{
  options = {
    nvidia.enable = 
      lib.mkEnableOption  "enables nvidia support";
  };
  config = lib.mkIf config.nvidia.enable {
    services.xserver.videoDrivers = [ "nvidia" ];

    boot = {
      # See: https://wiki.gentoo.org/wiki/NVIDIA/nvidia-drivers#Kernel_module_parameters
      kernelParams = [
        # Use NVIDIA framebuffer.
        "nvidia-drm.fbdev=1"

        # https://wiki.hyprland.org/Nvidia/#suspendwakeup-issues
        "nvidia.NVreg_PreserveVideoMemoryAllocations=1"
      ];
      blacklistedKernelModules = [ "amdgpu" "i915" ];
    };

    hardware = {
      nvidia = {
        modesetting.enable = true;
        powerManagement.enable = true;
        nvidiaSettings = true;
        package = config.boot.kernelPackages.nvidiaPackages.beta;
      };
      graphics.extraPackages = with pkgs; [ vaapiVdpau ];
    };

    environment.sessionVariables = {
      LIBVA_DRIVER_NAME = "nvidia";
      GBM_BACKEND = "nvidia-drm";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    };

    nix.settings = {
      substituters = [ "https://cuda-maintainers.cachix.org" ];
      trusted-public-keys = [ "cuda-maintainers.cachix.org-1:0dq3bujKpuEPMCX6U4WylrUDZ9JyUG0VpVZa7CNfq5E=" ];
    };
  };
}
