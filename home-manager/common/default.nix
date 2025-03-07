{ inputs, ... }:
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./1password
    ./git
    ./terminal
    ./shell
    ./browser
    ./desktop-environment/hyprland
    ./desktop-environment/ignis
    ./vscode.nix
    ./apps
    ./neovim
    ./vlc
  ];
}
