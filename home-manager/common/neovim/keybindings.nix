{
  programs.nixvim = {
    keymaps = [
      {
        mode = "n";
        key = "<leader>qq";
        action = ":confirm qa<CR>";
      }
    ];
  };
}
