{ pkgs, lib, ...}: 
{
  environment.systemPackages = with pkgs; [
    unstable.neovim
  ];
}
