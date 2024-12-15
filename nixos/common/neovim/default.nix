{ pkgs, lib, ...}: 
{
  environment.systemPackages = with pkgs; [
    lynx
    lua-language-server
    ruby
    solargraph # Ruby language server
    python3
    python3Packages.python-lsp-server # Python language server
  ];

  programs.neovim = {
    enable = true;
    vimAlias = true;
    viAlias = true;
  };
}
