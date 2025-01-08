# neovim.nix
# configuration for neovim
{ inputs, ... }:
{
  imports = [ inputs.nvf.nixosModules.default ];
  programs.neovim = {
    defaultEditor = true;
  };
  # programs.nvf = {
  #   enable = true;
  # };
}
