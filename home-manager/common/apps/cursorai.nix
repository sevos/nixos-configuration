{ pkgs, ...}:

{
  home.packages = [
    pkgs.unstable.code-cursor
    pkgs.unstable.zed-editor
  ];
}
