{pkgs, ...}:
{
  home.packages = [
    pkgs.zoxide
  ];

  programs.bash.bashrcExtra = ''
    eval "$(zoxide init --cmd cd bash)"
  '';
}
