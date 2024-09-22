#template.nix
#can be used to quickly make package modules, this is somehting i want to get more comfortable using 
{ config, pkgs, ... }:
{

   environment.systemPackages = with pkgs; [
      #packages can be added like below
      #git 
   ];

}
