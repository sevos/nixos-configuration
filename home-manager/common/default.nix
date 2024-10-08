{pkgs, ...}:
{
  imports = [
    ./1password
    ./git
    ./terminal
    ./shell
    ./browser
  ];

  home.packages = with pkgs; [
    slack
  ];
}
