_: {
  imports = [
    ./cmp
    ./editor
    ./git
    ./lsp
    ./snippets
    ./ui
    ./utils
    ./oil.nix
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
  };
}
