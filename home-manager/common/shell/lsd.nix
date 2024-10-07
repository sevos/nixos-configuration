{pkgs, ...}:
{
  home.packages = [
    pkgs.lsd
  ];

  programs.bash.shellAliases = {
    ls = "lsd";
    l = "ls -l";
    la = "ls -a";
    lla = "ls -la";
    lt = "ls --tree";
    tree = "ls";
  };
}
