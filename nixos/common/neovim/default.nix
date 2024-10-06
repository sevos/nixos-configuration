{ pkgs, ...}: {
  programs.neovim = {
    defaultEditor = true;

    # The attributes below seem not to work
    # with neovim from another stream
    # viAlias = true;
    # vimAlias = true;
  };

  programs.bash.shellAliases = {
    vi = "nvim";
    vim = "nvim";
  };

  environment.systemPackages = [
    pkgs.unstable.neovim
  ];
}
