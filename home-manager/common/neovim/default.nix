_: {
  imports = [
    ./cmp
    ./editor
    ./git
    ./lsp
    ./snippets
    ./ui
    ./utils
    ./auto_cmds.nix
    ./keybindings.nix
    ./settings.nix
  ];

  programs.nixvim = {
    enable = true;
    vimAlias = true;
    vimdiffAlias = true;
  };
}
