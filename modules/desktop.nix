#desktop.nix
#For now just packages I only want on my desktop

{ pkgs, lib, config, ... }:

{
  options = {
    custom.desktop.enable = 
      lib.mkEnableOption "desktop packages";
  };
  
  custom.desktop.enable =
    lib.mkDefault false;

  config = lib.mkIf config.custom.desktop.enable {
 
  environtment.systemPackages = with pkgs; [
    whipper
   ]; 
  };
}
