{ pkgs, ... }:
{
  # nixpkgs = {
    # overlays = [
	  # (final: prev: {
	    # vimPlugins = prev.vimPlugins // {
		  # own-onedark-nvim = prev.vimUtils.buildVimPlugin {
		    # name = "onedark";
			# src = inputs.plugin-onedark;
		  # };
		# };
	  # };
	# ];
  # };
  # Above block can be used to import custom plugins using flake i think, see neovim and nix home-manager: superscharge your development environment video on youtube

  programs.neovim =
  let
    toLua = str: "lua << EOF\n${str}\nEOF\n";
	toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
  in
  {
    enable = true;

	extraPackages = with pkgs; [
	  nil
      nixd
      luajitPackages.lua-lsp
	  # xclip
	  wl-clipboard

      lua-language-server
	];
    
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    plugins = with pkgs.vimPlugins; [
      {
	    plugin = nvim-lspconfig;
        config = toLuaFile ./plugin/lsp.lua;
      }

      {
        plugin = comment-nvim;
		config = toLua "require(\"Comment\").setup()";
	  }

      {
        plugin = tokyonight-nvim;
		config = "colorscheme tokyonight";
      }

      neodev-nvim

	  nvim-cmp

	  {
	    plugin = nvim-cmp;
		config = toLuaFile ./plugin/cmp.lua;
      }

      {
	    plugin = telescope-nvim;
		config = toLuaFile ./plugin/telescope.lua;
      }

	  telescope-fzf-native-nvim

	  cmp_luasnip
	  cmp-nvim-lsp

	  luasnip
      friendly-snippets

	  lualine-nvim
	  nvim-web-devicons

     {
      plugin = (nvim-treesitter.withPlugins (p: [
        p.tree-sitter-nix
        p.tree-sitter-vim
        p.tree-sitter-bash
        p.tree-sitter-lua
        p.tree-sitter-python
        p.tree-sitter-json
      ]));
      config = toLuaFile ./plugin/treesitter.lua;
     }

      vim-nix
    ];

    extraLuaConfig = ''
      ${builtins.readFile ./options.lua}
    '';
    # extraLuaConfig = ''
    #    ${builtins.readFile ./options.lua}
    # '';
  };
}
