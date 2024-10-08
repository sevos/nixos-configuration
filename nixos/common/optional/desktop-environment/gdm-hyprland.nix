{pkgs, ...}: 
{
  programs.hyprland = {
    # Install the packages from nixpkgs
    enable = true;
    # Select package
    package = pkgs.unstable.hyprland;
    # Whether to enable XWayland
    xwayland.enable = true;
  };
}
