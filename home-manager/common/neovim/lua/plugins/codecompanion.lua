return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = true,
    adapters = {
      ollama = function()
        return require("codecompanion.adapters").extend("ollama", {
          env = {
            url = "http://10.10.11.10:11434",
--            api_key = "OLLAMA_API_KEY",
          },
--          headers = {
--            ["Content-Type"] = "application/json",
--            ["Authorization"] = "Bearer ${api_key}",
--          },
          parameters = {
            sync = true,
          },
        })
      end,
    },
  }
}
