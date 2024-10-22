{
  home.file.".config/hypr/change-monitor-config.sh" = {
    source = ./change-config.sh;
  };

  
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "ln -sf $HOME/.config/hypr/monitor-config/default.conf $HOME/.config/hypr/monitor-config.conf && hyprctl reload && swww restore"
    ];
      
    bind = [
      "$mainMod SHIFT, D, exec, sh ~/.config/hypr/change-monitor-config.sh"
    ];

  };

  wayland.windowManager.hyprland.extraConfig = ''
    source = ~/.config/hypr/monitor-config.conf
  '';
}
