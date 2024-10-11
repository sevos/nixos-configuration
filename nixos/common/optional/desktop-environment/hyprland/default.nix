{...}: 
{
  imports = [
    ./config.nix
    ./wayland.nix
  ];

  services.xserver.desktopManager.gnome.enable = true;
  #  services.xserver.displayManager.gdm = {
  #  enable = true;
  #};

  programs.hyprland = {
    # Install the packages from nixpkgs
    enable = true;
    # Whether to enable XWayland
    xwayland.enable = true;
  };
}
