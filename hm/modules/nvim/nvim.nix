{ config, pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    plugins = with pkgs.vimPlugins [
      nvim-lspconfig
     
      comment-nvim
      tokyonight-nvim

      neodev-nvim

	  nvim-cmp
	  nvim-cmp;

	  telescope-nvim;

	  telescrop-fzf-native-nvim

	  cmp_luasnip
	  cmp-nvim-lsp

	  luasnip
      friendly-snippets

	  lualine-nvim
	  nvim-web-devicons

      (nvim-treesitter.withPlugins (p: [
        p.tree-sitter-nix
        p.tree-sitter-vim
        p.tree-sitter-bash
        p.tree-sitter-lua
        p.tree-sitter-python
        p.tree-sitter-json
      ]));

      vim-nix
    ];

    extraLuaConfig = ''
       ${builtins.readFile ./options.lua};
    '';
  };
}
