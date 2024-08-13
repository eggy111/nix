 { 
  description = "nixos config flake";
  inputs = {
    nixpkgs = { 
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
     home-manager = {
       url = "github:nix-community/home-manager";
       inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-colors.url = "github:misterio77/nix-colors";
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
   };
   nixConfig = {
     extra-substituters = [
       "https://hyprland.cachix.org"
       "https://nix-gaming.cachix.org"
       "https://anyrun.cachix.org"
       "https://nix-community.cachix.org"
       "https://yazi.cachix.org"
     ];
     extra-trusted-public-keys = [
       "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
       "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4"
       "anyrun.cachix.org-1:pqBobmOjI7nKlsUMV25u9QHa9btJK65/C8vnO3p346s="
       "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
       "yazi.cachix.org-1:Dcdz63NZKfvUCbDGngQDAZq6kOroIrFoyO064uvLh8k="
           ];
         };         
   outputs = {
     self,
     nixpkgs,
     home-manager,
     ...
   } @ inputs: let
     system = "x86_64-linux";
     pkgs = import nixpkgs {
       inherit system;
       config = {
        allowUnfree = true;
       };
     };
    in {
     nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
       ./hosts/default/configuration.nix
       inputs.home-manager.nixosModules.home-manager
       ];
      };
    };    
  } 