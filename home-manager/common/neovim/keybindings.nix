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
        mode = [
          "n"
          "i"
        ];
        key = "<C-s>";
        action = "<esc>:w<cr>";
      }
    ];
  };
}
