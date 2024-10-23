{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    hyprshot
  ];

  wayland.windowManager.hyprland.settings = {
    bind = [
      "$mainMod, F4, exec, hyprshot -m window --clipboard-only"
      "$mainMod SHIFT, F4, exec, hyprshot -m region --clipboard-only"
    ];
  };
}
