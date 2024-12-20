_: {
  programs.nixvim = {
    plugins.toggleterm = {
      enable = true;
      settings = {
        size = 20;
      };
    };
    keymaps = [
      {
        mode = "n";
        key = "<leader>T";
        action = "<cmd>ToggleTerm<cr>";
        options = {
          desc = "Toggle Terminal Window";
        };
      }
      {
        mode = "n";
        key = "<leader>Tv";
        action = "<cmd>ToggleTerm direction=vertical<cr>";
        options = {
          desc = "Toggle Vertical Terminal Window";
        };
      }
      {
        mode = "n";
        key = "<leader>Th";
        action = "<cmd>ToggleTerm direction=horizontal<cr>";
        options = {
          desc = "Toggle Horizontal Terminal Window";
        };
      }
      {
        mode = "n";
        key = "<leader>Tf";
        action = "<cmd>ToggleTerm direction=float<cr>";
        options = {
          desc = "Toggle Floating Terminal Window";
        };
      }
    ];
  };
}
