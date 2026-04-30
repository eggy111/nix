{ inputs, pkgs, ... }:
{
  imports = [ inputs.nvf.nixosModules.default ];

  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        viAlias = true;
        vimAlias = true;
        globals.mapleader = " ";
        lsp = {
          enable = true;
          formatOnSave = true;
        };
        extraPlugins = {
          zen-mode = {
            package = pkgs.vimPlugins.zen-mode-nvim;
            setup = ''
              require ('zen-mode').setup({
                window = {
                width = 80,
                options = { 
                        number = false,
                        relativenumber = false,
                        signcolumn = "no",
                        },
                },
                })
            '';
          };
        };
        # spellcheck = {
        #   enable = true;
        #   languages = [ "en" ];
        # };
        # autoGroups = {
        #   markdown_spell = { };
        # };
        #
        # autocmds = [
        #   {
        #     event = [ "Filetype" ];
        #     pattern = [ "markdown" ];
        #     group = "markdown_spell";
        #     command = "setlocal spell spelllang=en_us";
        #   }
        #   {
        #     event = [ "Filetype" ];
        #     pattern = [ "!markdown" ];
        #     group = "markdown_spell";
        #     command = "setlocal nospell";
        #   }
        # ];

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
          whichKey.enable = true;
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
          bash = {
            enable = true;
            lsp.enable = true;
            lsp.servers = [ "bash-language-server" ];
          };
          css = {
            enable = true;
            lsp.enable = true;
          };
          lua.enable = true;
          markdown.enable = true;
          nix = {
            enable = true;
            format.type = [ "nixfmt" ];
            lsp.enable = true;
            lsp.servers = [ "nil" ];
          };
        };

        filetree.neo-tree = {
          enable = true;
          setupOpts = {
            filesystem.filtered_items = {
              visible = true;
              hide_dotfiles = false;
              hide_gitignored = false;
            };
          };
        };
        telescope.enable = true;

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
        maps.normal = {
          # neo-tree toggle
          "<leader>e" = {
            action = "<cmd>Neotree toggle<CR>";
            desc = "Toggle file tree";
          };
          # Telescope
          "<leader>ff" = {
            action = "<cmd>Telescope find_fires<CR>";
            desc = "Find files";
          };
          "<leader>fg" = {
            action = "<cmd>Telescope live_grep<CR>";
            desc = "Live grep";
          };
          "<leader>fb" = {
            action = "<cmd>Telescope buffers<CR>";
            desc = "Find buffers";
          };
          "<leader>z" = {
            action = "<cmd>ZenMode<CR>";
            desc = "Toggle zen mode";
          };
        };
      };
    };
  };
}
