local parser_install_dir = vim.fn.stdpath("cache") .. "/treesitters"
vim.fn.mkdir(parser_install_dir, "p")
vim.opt.runtimepath:append(parser_install_dir)

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
    },
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        auto_install = true,
        parser_install_dir = parser_install_dir,
        highlight = { enable = true },
        indent = { enable = false },
      })
    end
  },
}
