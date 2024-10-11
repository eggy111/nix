#desktop.nix
#For now just packages I only want on my desktop

{ pkgs, lib, config, ... }:

{
  options = {
    custom.desktop.enable = 
      lib.mkEnableOption "desktop packages";
  };
  
  config = lib.mkIf config.custom.desktop.enable {
 
  environment.systemPackages = with pkgs; [
    whipper
   ]; 
  };
}
