#modules/users/default.nix

{
 imports = 
  [
   ./users.nix
   ./main-user.nix
  ];
 main-user.enable = true;
 main-user.userName = "eggy";
}
