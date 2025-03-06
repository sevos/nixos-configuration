{pkgs, ...}:

{
  imports = [
    ./monitor-config
    ./hyprland.nix
    ./clipboard.nix
    ./hyprshot.nix
  ];

  home.packages = with pkgs; [
    xdg-desktop-portal-hyprland
    wofi
    dunst
    waybar
    hyprcursor
    hypridle
    hyprlock
    swaylock-effects
    swww
    waypaper
    brightnessctl
    wireplumber
    pipewire
    wlogout
    wev
    networkmanagerapplet
    pavucontrol
    unstable.font-awesome
    unstable.ulauncher
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

  home.file.".config/dunst/dunstrc" = {
    source = ./dunstrc;
  };

  home.file.".config/waybar" = {
    source = ./waybar;
    recursive = true;
  };

  home.file.".config/swaylock/config" = {
    source = ./swaylock.conf;
  };

  home.file.".config/ulauncher/settings.json" = {
    source = ./ulauncher.json;
  };
}
