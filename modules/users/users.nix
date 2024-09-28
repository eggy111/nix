{ config, pkgs, ... }:

{
 users.users.eggy = {
   isNormalUser = true;
   #description = "eggy";
   extraGroups = [ "networkmanager" "wheel" ];
   packages = with pkgs; [

   ];
 };
}
