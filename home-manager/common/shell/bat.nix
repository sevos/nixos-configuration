{pkgs, ...}:
{
  home.packages = [
    pkgs.bat
  ];

  programs.bash.shellAliases = {
    cat = "bat";
  };
}
