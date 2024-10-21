
{pkgs, ...}:
{
  home.packages = with pkgs; [
    unstable.slack
  ];

  wayland.windowManager.hyprland.settings = {
    workspace = [
        "special:slack, on-created-empty:slack"
    ];

    bind = [
        "$mainMod, S, togglespecialworkspace, slack"
    ];
  };
}
