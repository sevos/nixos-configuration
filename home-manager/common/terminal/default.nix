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
      env.TERM = "xterm-256color";
      bell = {
        animation = "Ease";
        duration = 200;
        color = "#7aa2f7";
      };
      cursor = {
        style = {
          shape = "Beam";
        };
      };

      window = {
        padding = { x = 10; y = 10; };
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
