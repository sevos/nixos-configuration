{inputs, config, pkgs, ...}:

{
  home.sessionVariables = {
    EDITOR = "nvim";
  };
  
  programs.neovim = {
    enable = true;
    package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
    vimAlias = true;
    vimdiffAlias = true;
    withNodeJs = true;

    plugins = with pkgs.unstable.vimPlugins; [
      # base distro
      LazyVim
      conform-nvim
      nvim-lint
      markdown-preview-nvim
      render-markdown-nvim
      headlines-nvim
      indent-blankline-nvim
      persistence-nvim
      mini-starter
      mini-ai
      mini-pairs
      mini-animate
      vim-repeat

      # UI
      tokyonight-nvim
      bufferline-nvim
      gitsigns-nvim
      edgy-nvim
      toggleterm-nvim
      trouble-nvim
      lualine-nvim
      which-key-nvim
      nvim-web-devicons
      mini-nvim
      noice-nvim
      nui-nvim
      nvim-notify
      nvim-lsp-notify
      neo-tree-nvim
      nvim-navic
      dressing-nvim
      aerial-nvim
      snacks-nvim
      vim-illuminate


      # treesitter
      nvim-treesitter-context
      nvim-ts-autotag
      nvim-treesitter-textobjects
      nvim-treesitter.withAllGrammars

      # LSP
      nvim-lspconfig
      rust-tools-nvim
      crates-nvim
      null-ls-nvim
      nvim-lightbulb # lightbulb for quick actions
      # nvim-code-action-menu # code action menu
      neodev-nvim
      SchemaStore-nvim # load known formats for json and yaml

      # cmp plugins
      nvim-cmp # completion plugin
      cmp-buffer # buffer completions
      cmp-path # path completions
      cmp_luasnip # snipper completions
      cmp-nvim-lsp # LSP completions
      lazydev-nvim

      # snippets
      luasnip # snippet engine
      friendly-snippets # a bunch of snippets to use
      nvim-snippets

      # search functionality
      plenary-nvim
      telescope-nvim
      telescope-fzf-native-nvim
      nvim-spectre
      flash-nvim

      # comments
      nvim-ts-context-commentstring
      ts-comments-nvim
      todo-comments-nvim

      lazy-nvim

      # AI
      codecompanion-nvim
    ];
  
    extraLuaConfig = ''
      vim.g.mapleader = " " -- Need to set leader before lazy for correct keybindings
      require("lazy").setup({
        spec = {
          { "LazyVim/LazyVim", import = "lazyvim.plugins" },
          -- import any extras modules here
          { import = "lazyvim.plugins.extras.dap.core" },
          { import = "lazyvim.plugins.extras.dap.nlua" },
          { import = "lazyvim.plugins.extras.ui.edgy" },
          { import = "lazyvim.plugins.extras.editor.aerial" },
          { import = "lazyvim.plugins.extras.editor.leap" },
          { import = "lazyvim.plugins.extras.editor.navic" },
          { import = "lazyvim.plugins.extras.editor.illuminate" },
          { import = "lazyvim.plugins.extras.lang.docker" },
          { import = "lazyvim.plugins.extras.lang.json" },
          { import = "lazyvim.plugins.extras.lang.markdown" },
          { import = "lazyvim.plugins.extras.lang.rust" },
          { import = "lazyvim.plugins.extras.lang.yaml" },
          { import = "lazyvim.plugins.extras.test.core" },
          -- { import = "lazyvim.plugins.extras.ui.mini-animate" },
          { import = "lazyvim.plugins.ui" },
          -- Import plugins from lua/plugins
          { import = "plugins" },
        },
        defaults = {
          -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
          -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
          lazy = false,
          -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
          -- have outdated releases, which may break your Neovim install.
          version = false, -- always use the latest git commit
          -- version = "*", -- try installing the latest stable version for plugins that support semver
        },
        performance = {
          reset_packpath = false,
          rtp = {
            reset = false,
            -- disable some rtp plugins
            disabled_plugins = {
              "gzip",
              -- "matchit",
              -- "matchparen",
              "netrwPlugin",
              "tarPlugin",
              "tohtml",
              "tutor",
              "zipPlugin",
            },
          },
        },
        dev = {
          path = "${pkgs.vimUtils.packDir config.programs.neovim.finalPackage.passthru.packpathDirs}/pack/myNeovimPackages/start",
          patterns = {""}, -- Specify that all of our plugins will use the dev dir. Empty string is a wildcard!
        },
        install = {
          -- Safeguard in case we forget to install a plugin with Nix
          missing = false,
        },
      })

      vim.opt.relativenumber = false
      -- enable automatic newline at end of the file
      vim.opt.eol = true
      vim.opt.fixendofline = true
    '';

    extraPackages = with pkgs; [
      gcc # needed for nvim-treesitter

      # LazyVim defaults
      stylua
      shfmt

      # Markdown extra
      nodePackages.markdownlint-cli
      marksman

      # Docker extra
      nodePackages.dockerfile-language-server-nodejs
      hadolint
      docker-compose-language-service

      # JSON and YAML extras
      nodePackages.vscode-json-languageserver
      nodePackages.yaml-language-server

      # Custom
      editorconfig-checker
      shellcheck

      # nix
      statix
    ];
  };

  xdg.configFile."nvim/lua" = {
    recursive = true;
    source = ./lua;
  };
}
