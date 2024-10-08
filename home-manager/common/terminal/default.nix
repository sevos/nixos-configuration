{pkgs, ...}:
{
  home.packages = with pkgs; [
    alacritty
    nerdfonts
  ];

  programs.alacritty = {
    enable = true;
    # custom settings
    settings = {
      import = [
        pkgs.alacritty-theme.tokyo-night
      ];
      env.TERM = "xterm-256color";
      font = {
        normal = {
          family = "IosevkaTerm Nerd Font Mono";
        };
        size = 16;
      };
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
      mouse = {
        hide_when_typing = false;
      };
      keyboard = {
        bindings = [
          { key = "N"; mods = "Control|Shift"; action = "CreateNewWindow"; }
        ];
      };
    };
  };
}
