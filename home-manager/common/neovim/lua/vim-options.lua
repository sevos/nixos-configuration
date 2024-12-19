-- Set leader to space
vim.g.mapleader = " "
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

-- Navigate vim panes better
-- vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
-- vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
-- vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
-- vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

-- Use wl-copy and wl-paste for clipboard in Wayland
vim.g.clipboard = {
  name = "wl-clipboard",
}

-- Enable direnv
vim.g.direnv_auto = 1
