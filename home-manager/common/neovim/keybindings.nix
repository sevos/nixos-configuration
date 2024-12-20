{
  programs.nixvim = {
    globals.mapleader = " ";
    keymaps = [
      {
        mode = "n";
        key = "<leader>qq";
        action = ":confirm qa<CR>";
      }
      {
        mode = "n";
        key = "<C-s>";
        action = ":w<CR>";
      }
    ];
  };
}
