{inputs, config, pkgs, ...}:

{
  imports = [
    ./git
    ./snippets
    ./completions.nix
    ./copilot.nix
    ./oil.nix
    ./telescope.nix
  ];

  programs.nixvim = {
    enable = true;
    vimAlias = true;
    vimdiffAlias = true;

    plugins = {
      treesitter.enable = true;
      web-devicons.enable = true;
      which-key.enable = true;
    };

    globals.mapleader = " ";

    extraConfigLuaPre = ''
      -- Line numbers
      vim.opt.relativenumber = false
      vim.wo.number = true
      -- enable automatic newline at end of the file
      vim.opt.eol = true
      vim.opt.fixendofline = true
      
      vim.cmd("set expandtab")
      vim.cmd("set tabstop=2")
      vim.cmd("set softtabstop=2")
      vim.cmd("set shiftwidth=2")
      
      vim.opt.swapfile = false
    '';

    # plugins = with pkgs.unstable.vimPlugins; [
    #   # base distro
    #   LazyVim
    #   oil-nvim

    #   # UI
    #   which-key-nvim

    #   # treesitter
    #   nvim-treesitter-context
    #   nvim-treesitter-textobjects
    #   nvim-treesitter.withAllGrammars

    #   # LSP
    #   nvim-lspconfig

    #   # cmp plugins
    #   nvim-cmp
    #   luasnip
    #   cmp-nvim-lsp
    #   cmp_luasnip

    #   # snippets
    #   friendly-snippets


    #   # search functionality
    #   plenary-nvim
    #   telescope-nvim
    #   telescope-fzf-native-nvim

    #   # comments

    #   # AI

    #   # Rails

    #   # Others
    #   direnv-vim
    # ];
  
    # extraLuaConfig = ''
    #   vim.g.mapleader = " " -- Need to set leader before lazy for correct keybindings
    #   require("lazy").setup({
    #     spec = {
    #       -- { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    #       -- import any extras modules here
    #       -- Import plugins from lua/plugins
    #       { import = "plugins" },
    #     },
    #     defaults = {
    #       -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    #       -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    #       lazy = false,
    #       -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    #       -- have outdated releases, which may break your Neovim install.
    #       version = false, -- always use the latest git commit
    #       -- version = "*", -- try installing the latest stable version for plugins that support semver
    #     },
    #     performance = {
    #       reset_packpath = false,
    #       rtp = {
    #         reset = false,
    #         -- disable some rtp plugins
    #         disabled_plugins = {
    #           "gzip",
    #           -- "matchit",
    #           -- "matchparen",
    #           "netrwPlugin",
    #           "tarPlugin",
    #           "tohtml",
    #           "tutor",
    #           "zipPlugin",
    #         },
    #       },
    #     },
    #     dev = {
    #       path = "${pkgs.vimUtils.packDir config.programs.neovim.finalPackage.passthru.packpathDirs}/pack/myNeovimPackages/start",
    #       patterns = {""}, -- Specify that all of our plugins will use the dev dir. Empty string is a wildcard!
    #     },
    #     install = {
    #       -- Safeguard in case we forget to install a plugin with Nix
    #       missing = false,
    #     },
    #   })
    # '';

    # extraPackages = with pkgs; [
    #   fd
    #   gcc # needed for nvim-treesitter
    #   lua54Packages.luasnip
    #   direnv
    #   devenv
    # ];
  };
}
