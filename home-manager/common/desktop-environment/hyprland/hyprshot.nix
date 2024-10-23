{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    hyprshot
    swappy
  ];

  wayland.windowManager.hyprland.settings = {
    bind = [
      "$mainMod, F4, exec, hyprshot --freeze -m window --clipboard-only --raw | swappy -f -"
      "$mainMod SHIFT, F4, exec, hyprshot --freeze -m region --clipboard-only --raw | swappy -f -"
    ];
  };
}
