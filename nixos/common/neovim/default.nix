{ pkgs, lib, ...}: 
let
  copilotChatRepo = {
    owner = "copilotc-nvim";
    repo = "CopilotChat.nvim";
    rev = "23545dc12dd6fa272eba35c88a2404a4f90a88b1";
    hash = "sha256-HtgWAPQ55o11s+XWFOybAaWMRjZ4iysajq48YHWxhX4=";
  };
in
{
  environment.systemPackages = with pkgs; [
    github-copilot-cli
    lynx
  ];

  programs.nixvim = {
    enable = true;
    colorschemes.tokyonight.enable = true;

    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    opts = {
      backup = true;
      cursorline = true;
      expandtab = true; 
      fileencoding = "utf-8";
      gdefault = true;
      history = 100;
      ignorecase = true;
      number = true;
      shiftround = true;
      shiftwidth = 2;
      smartcase = true;
      softtabstop = 2;
      splitbelow = true;
      swapfile = false;
      tabstop = 2;
      updatetime = 100;
      wrap = false;

      backupdir = "/tmp";
      undodir = "/tmp";

      clipboard = { 
        register = "unnamedplus";

        providers.wl-copy = {
          enable = true;
        };
      };
    };

    plugins = {
      lualine.enable = true;
      treesitter.enable = true;
      ts-autotag.enable = true;
      luasnip.enable = true;
      commentary.enable = true;
      vim-surround.enable = true;
      web-devicons.enable = true;
      which-key.enable = true;
      gitsigns.enable = true;
      lazygit.enable = true;
      nvim-tree = {
        enable = true;
        openOnSetup = true;
        openOnSetupFile = true;
      };

      telescope = {
        enable = true;
        settings.defaults = {
          layout_strategy = "horizontal";
          layout_config = {
            preview_width = 0.65;

            horizontal = {
              size = {
                width = 0.95;
                height = 0.95;
              };
            };
          };
          
          file_ignore_patterns = [ "^.git/" ];
        };

        keymaps."<C-p>" = "git_files";
        keymaps."<leader>g" = "live_grep";
        keymaps."<leader>j" = "grep_string";
      };

      lspkind = {
        enable = true;

        symbolMap = {
          Copilot = "";
        };

        extraOptions = {
          maxwidth = 50;
          ellipsis_char = "...";
        };
      };

      lsp = {
        enable = true;

        servers = {
          bashls.enable = true;
          nil_ls.enable = true;
          ts_ls.enable = true;
          lua_ls.enable = true;
          html.enable = true;
          jsonls.enable = true;
          marksman.enable = true;
          yamlls.enable = true;
        };
      };

      cmp-emoji = {enable = true;};
      cmp-nvim-lsp = {enable = true;};
      cmp-buffer = {enable = true;};
      cmp-path = {enable = true;}; 
      cmp_luasnip = {enable = true;}; 
      cmp-cmdline = {enable = false;};
      copilot-cmp = {enable = true;};
      copilot-lua = {
        enable = true;
        suggestion = {enabled = false;};
        panel = {enabled = false;};
      };

      cmp = {
        enable = true;

        settings = {
          autoEnableSources = true;
          experimental = {ghost_text = true;};
          performance = {
            debounce = 60;
            fetchingTimeout = 200;
            maxViewEntries = 30;
          };
          snippet = {expand = "luasnip";};
          formatting = {fields = ["kind" "abbr" "menu"];};
          sources = [
          {name = "nvim_lsp";}
          {name = "emoji";}
          {
            name = "buffer"; # text within current buffer
              option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
            keywordLength = 3;
          }
          {name = "copilot";}
          {
            name = "path";
            keywordLength = 3;
          }
          {
            name = "luasnip";
            keywordLength = 3;
          }
          ];

          window = {
            completion = {border = "solid";};
            documentation = {border = "solid";};
          };

          mapping = {
            "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
            "<C-j>" = "cmp.mapping.select_next_item()";
            "<C-k>" = "cmp.mapping.select_prev_item()";
            "<C-e>" = "cmp.mapping.abort()";
            "<C-b>" = "cmp.mapping.scroll_docs(-4)";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<C-Space>" = "cmp.mapping.complete()";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<S-CR>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })";
          };
        };
      };
    };

    keymaps = [
      {
        key = "<leader>qq";
        options = { desc = "Quit all without saving"; };
        action = "<cmd>qa!<CR>";
      }

      {
        key = "<leader>qx";
        options = { desc = "Save all and quit"; };
        action = "<cmd>xa<CR>";
      }

      {
        options = { desc = "List and switch buffer"; };
        key = "<leader>,";
        action = "<cmd>Telescope buffers<CR>";
      }

      {
        key = "<leader>bd";
        action = "<cmd>bd<CR>";
        options = { desc = "Delete current buffer"; };
      }

      {
        options = { desc = "Delete other buffers"; };
        action = "<cmd>BufOnly<CR>";
        key = "<leader>bo";
      }

      {
        action = "<cmd>NvimTreeToggle<CR>";
        key = "<leader>e";
      }

      {
        action = "<cmd>write<CR>";
        key = "<C-s>";
      }

      {
        action = "<cmd>Telescope live_grep<CR>";
        key = "<leader>/";
      }

      {
        action = "<cmd>Telescope find_files<CR>";
        key = "<leader><leader>";
      }

      {
        action = "<cmd>Explore<CR>";
        key = "-";
      }

      {
        mode = "x";
        key = "<leader>p";
        action = ''"_dP'';
        options = {desc = "Deletes to void register and paste over";};
      }

      {
        mode = "x";
        key = "<leader>a";
        action = "+copilot";
      }

      {
        mode = "x";
        key = "<leader>ae";
        action = "<cmd>CopilotChatExplain<cr>";
      }

      {
        mode = "x";
        key = "<leader>af";
        action = "<cmd>CopilotChatFix<cr>";
      }

      {
        mode = "x";
        key = "<leader>ad";
        action = "<cmd>CopilotChatDocs<cr>";
      }

      {
        mode = "x";
        key = "<leader>ac";
        action = "<cmd>CopilotChatCommit<cr>";
      }

      {
        mode ="n";
        key = "<leader>a";
        action = "<cmd>CopilotChatToggle<cr>";
      }

      {
        mode = "n";
        key = "//";
        action = "<cmd>Commentary<cr>";
      }

      {
        mode = "v";
        key = "//";
        action = "<cmd>'<,'>Commentary<cr>";
      }

      {
        mode = "v";
        key = "<";
        action = "<gv";
      }

      {
        mode = "v";
        key = ">";
        action = ">gv";
      }

      {
        mode = "n";
        key = "<leader>g";
        action = "<cmd>LazyGit<CR>";
      }
    ];

    extraPackages = with pkgs; [
      git ripgrep wl-clipboard
    ];

    extraPlugins = with pkgs.vimUtils; with pkgs.vimPlugins; [
      vim-toml file-line vim-gitgutter plenary-nvim nvim-colorizer-lua

        (buildVimPlugin {
         pname = "copilotchat";
         version = "1.9.0";
         src = pkgs.fetchFromGitHub copilotChatRepo;
         meta = {
         description = "Chat with GitHub Copilot in Neovim";
         homepage = "https://github.com/CopilotC-Nvim/CopilotChat.nvim/";
         license = lib.licenses.gpl3;
         };
         })
    ];

    extraConfigLua = ''
      require("copilot").setup({
          suggestion = { enabled = false },
          panel = { enabled = false },
          })

      require("CopilotChat").setup { }

      require 'colorizer'.setup()

      luasnip = require("luasnip")

      kind_icons = {
        Text = "󰊄",
        Method = "",
        Function = "󰡱",
        Constructor = "",
        Field = "",
        Variable = "󱀍",
        Class = "",
        Interface = "",
        Module = "󰕳",
        Property = "",
        Unit = "",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "",
        Event = "",
        Operator = "",
        TypeParameter = "",
      } 

      local cmp = require'cmp'

      -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline({'/', "?" }, {
          sources = {
          { name = 'buffer' }
          }
          })

      -- Set configuration for specific filetype.
      cmp.setup.filetype('gitcommit', {
          sources = cmp.config.sources({
              { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
              }, {
              { name = 'buffer' },
              })
          })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(':', {
          sources = cmp.config.sources({
              { name = 'path' }
              }, {
              { name = 'cmdline' }
              }),
          --      formatting = {
          --       format = function(_, vim_item)
          --         vim_item.kind = cmdIcons[vim_item.kind] or "FOO"
          --       return vim_item
          --      end
          -- }
          })  '';
  };
}
