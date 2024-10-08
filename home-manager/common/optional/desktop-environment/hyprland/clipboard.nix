{pkgs, ...}:
{
  home.packages = with pkgs; [
    wl-clipboard
    cliphist
    copyq
  ];

  
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "copyq --start-server"
      "wl-paste --type text --watch cliphist store"
      "wl-paste --type image --watch cliphist store"
    ];

    bind = [
      "SUPER, V, exec, cliphist list | wofi --dmenu | cliphist decode | wl-copy"
    ];
  };
}
