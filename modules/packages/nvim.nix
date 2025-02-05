{ inputs, ... }:
{
  imports = [ inputs.nvf.nixosModules.default ];

  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        viAlias = true;
        vimAlias = true;
        lsp = {
          enable = true;
        };

        autocomplete.nvim-cmp = {
          enable = true;
          mappings = {
            close = "<C-e>";
            complete = "<C-Space>";
            confirm = "<CR>";
            next = "<Tab>";
            previous = "<S-Tab>";
            scrollDocsDown = "<C-f>";
            scrollDocsUp = "<C-d>";
          };
          sourcePlugins = [
            "nvim-lspconfig"
            "luasnip"
          ];
        };
        binds = {
          cheatsheet.enable = true;
        };
        comments.comment-nvim = {
          enable = true;
          mappings = {
            toggleCurrentBlock = "gbc";
            toggleCurrentLine = "gcc";
          };
        };
        languages = {
          enableFormat = true;
          enableLSP = true;
          enableTreesitter = true;
          bash.enable = true;
          css.enable = true;
          html.enable = true;
          lua.enable = true;
          markdown.enable = true;
          nix = {
            enable = true;
            format.type = "nixfmt";
            lsp.enable = true;
            lsp.server = "nil";
          };
        };
        lsp.formatOnSave = true;
        theme = {
          enable = true;
          name = "catppuccin";
          style = "mocha";
        };
        utility = {
          diffview-nvim.enable = true;
          icon-picker.enable = true;
          images = {
            image-nvim = {
              enable = true;
              setupOpts.backend = "kitty";
              setupOpts.integrations.markdown = {
                enable = true;
                downloadRemoteImages = true;
              };
            };
          };
        };
      };
    };
  };
}
