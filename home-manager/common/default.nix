{inputs, ...}:
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./1password
    ./git
    ./terminal
    ./shell
    ./browser
    ./desktop-environment/hyprland
    ./apps
    ./neovim
  ];
}
