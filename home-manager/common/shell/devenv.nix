{pkgs, ...}:
{
  programs.direnv.enable = true;
  home.packages = with pkgs; [
    unstable.devenv
  ];
}
