{inputs, pkgs, ...}:

{
  imports = [
    ./settings.nix
  ];

  home.packages = with pkgs; [
    xdg-desktop-portal-hyprland
    wofi
    dunst
    waybar
    hyprcursor
    hypridle
    hyprlock
    hyprpaper
  ] ++ [
    inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
  ];

  wayland.windowManager.hyprland = {
    # Whether to enable Hyprland wayland compositor
    enable = true;
    # The hyprland package to use
    package = pkgs.hyprland;
    # Whether to enable XWayland
    xwayland.enable = true;

    # Optional
    # Whether to enable hyprland-session.target on hyprland startup
    systemd.enable = true;
  };
}
