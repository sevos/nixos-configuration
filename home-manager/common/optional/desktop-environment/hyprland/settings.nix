{
  wayland.windowManager.hyprland.settings = {
    "$terminal" = "alacritty";
    "$fileManager" = "nautilus";
    "$browser" = "chromium";
    "$menu" = "wofi --show drun";

    env = [
      "XCURSORSIZE, 36"
      "XCURSORTHEME, Adwaita"
      "HYPRCURSOR_SIZE, 36"
      "HYPRCURSOR_THEME, Adwaita"
      "GSK_RENDERER, ngl"
    ];

    exec-once = [
      "xdg-settings set default-web-browser org.chromium.Chromium.desktop"
      "hyprctl setcursor Adwaita 36"
      "gsettings set org.gnome.desktop.interface cursor-theme 'Adwaita'"
      "dunst"
      "waybar"
      "1password --silent"
    ];

    general = {
      no_border_on_floating = false;
      gaps_in = 5;
      gaps_out = 10;
      border_size = 2;
      resize_on_border = false;
      allow_tearing = false;
      layout = "dwindle";
    };

    decoration = {
      rounding = 10;

      active_opacity = 1.0;
      inactive_opacity = 0.7;

      drop_shadow = true;
      shadow_range = 4;
      shadow_render_power = 3;
      "col.shadow" = "rgba(1a1a1aee)";
      blur = {
        enabled = true;
        size = 4;
        passes = 2;
        vibrancy = 0.1696;
      };
    };  
     # https://wiki.hyprland.org/Configuring/Variables/#animations
    animations = {
      enabled = true;
      # Default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more
      bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
      animation = [
        "windows, 1, 7, myBezier"
        "windowsOut, 1, 7, default, popin 80%"
        "border, 1, 10, default"
        "borderangle, 1, 8, default"
        "fade, 1, 7, default"
        "workspaces, 1, 6, default"
      ];
    };
    
    # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more    
    dwindle = {
      pseudotile = true; # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
      preserve_split = true; # You probably want this
    };

    # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
    master = {
      new_status = "master";
    };

    # https://wiki.hyprland.org/Configuring/Variables/#misc
    misc = { 
      force_default_wallpaper = -1; # Set to 0 or 1 to disable the anime mascot wallpapers
      disable_hyprland_logo = true; # If true disables the random hyprland logo / anime girl background. :(
    };

    # https://wiki.hyprland.org/Configuring/Variables/#input
    input = {
      kb_layout = "pl";
      kb_variant = "";
      kb_model = "";
      kb_options = "";
      kb_rules = "";

      follow_mouse = 1;

      sensitivity = 0; # -1.0 - 1.0, 0 means no modification.

      touchpad = {
          natural_scroll = true;
          scroll_factor = 0.6;
          drag_lock = true;
      };
    };

    # https://wiki.hyprland.org/Configuring/Variables/#gestures
    gestures = {
        workspace_swipe = true;
        workspace_swipe_fingers = 3;
    };

    "$mainMod" = "SUPER";

    bind = [
      "$mainMod, RETURN, exec, $terminal"
      "$mainMod, Q, killactive,"
      "$mainMod, M, exit,"
      "$mainMod, E, exec, $fileManager"
      "$mainMod, B, exec, $browser"
      "$mainMod, F, togglefloating,"
      "$mainMod, SPACE, exec, $menu"
      "$mainMod, P, pseudo,"
      "bind = $mainMod, J, togglesplit, "

      # Move focus with mainMod + arrow keys
      "$mainMod, left, movefocus, l"
      "$mainMod, right, movefocus, r"
      "$mainMod, up, movefocus, u"
      "$mainMod, down, movefocus, d"
      
      # Switch workspacEs with mainMod + [0-9]
      "$mainMod, code:49, workspace, name:Top"
      "$mainMod, 1, workspace, 1"
      "$mainMod, 2, workspace, 2"
      "$mainMod, 3, workspace, 3"
      "$mainMod, 4, workspace, 4"
      "$mainMod, 5, workspace, 5"
      "$mainMod, 6, workspace, 6"
      "$mainMod, 7, workspace, 7"
      "$mainMod, 8, workspace, 8"
      "$mainMod, 9, workspace, 9"
      "$mainMod, 0, workspace, 10"

      # Move active window to a workspace with mainMod + SHIFT + [0-9]
      "$mainMod SHIFT, code:49, movetoworkspace, name:Top"
      "$mainMod SHIFT, 1, movetoworkspace, 1"
      "$mainMod SHIFT, 2, movetoworkspace, 2"
      "$mainMod SHIFT, 3, movetoworkspace, 3"
      "$mainMod SHIFT, 4, movetoworkspace, 4"
      "$mainMod SHIFT, 5, movetoworkspace, 5"
      "$mainMod SHIFT, 6, movetoworkspace, 6"
      "$mainMod SHIFT, 7, movetoworkspace, 7"
      "$mainMod SHIFT, 8, movetoworkspace, 8"
      "$mainMod SHIFT, 9, movetoworkspace, 9"
      "$mainMod SHIFT, 0, movetoworkspace, 10"

      # Example special workspace (scratchpad)
      "$mainMod, S, togglespecialworkspace, magic"
      "$mainMod SHIFT, S, movetoworkspace, special:magic"
      
      "$mainMod, C, togglespecialworkspace, chatgpt"

			# Scroll through existing workspaces with mainMod + scroll
			"$mainMod, mouse_down, workspace, e+1"
			"$mainMod, mouse_up, workspace, e-1"
    ];

		bindm = [
			# Move/resize windows with mainMod + LMB/RMB and dragging
			"$mainMod, mouse:272, movewindow"
			"$mainMod, mouse:273, resizewindow"
		];

		bindel = [
			# Laptop multimedia keys for volume and LCD brightness
			",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
			",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
			",XF86AudioMute, exec, wpctl set-mute @DEFAULT_0AUDIO_SINK@ toggle"
			",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
			",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
			",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
		];


		windowrule = [
			"float,^(pavucontrol)$"
			"float,^(blueman-manager)$"
			"float,^(nm-connection-editor)$"
			"float,^(qalculate-gtk)$"
		];
		
		windowrulev2 = [
			# no opcacity for windows with "Meet" in title
			"opacity 1.0 override,title:^Meet.*$"
			"opacity 1.0 override,title:^YouTube.*$"
			"suppressevent maximize, class:.*" # You'll probably like this.
		];
  };
}
