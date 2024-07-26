#opengl, and maybe also proton stuff

 { pkgs, ... }:

 {
   hardware.graphics = {
     enable = true;
  #   driSupport = true;
     enable32Bit = true;
   };

   programs.steam.enable = true;
   programs.steam.gamescopeSession.enable = true;

   environment.systemPackages = with pkgs; [
     mangohud
   ];

   programs.gamemode.enable = true;
   
  
  # environment.systemPackages = with pkgs; [
  #   protonup
  # ];
  
   environment.sessionVariables = {
     STEAM_EXTRA_COMPAT_TOOLS_PATH = 
     "/home/eggy/.stean/root/compatibilitytools.d";
   };

  }


