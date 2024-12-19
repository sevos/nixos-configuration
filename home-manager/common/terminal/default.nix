{pkgs, config, ...}:
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

      general.import = [
        "~/.config/alacritty/themes/themes/tokyo_night.toml"
      ];

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
      font = {
        normal.family = "CaskaydiaMono Nerd Font";
        normal.style = "Regular";
        bold.family = config.programs.alacritty.settings.font.normal.family;
        bold.style = "Bold";
        italic.family = config.programs.alacritty.settings.font.normal.family;
        italic.style = "Italic";
        bold_italic.family = config.programs.alacritty.settings.font.normal.family;
        bold_italic.style = "Bold Italic";
        size = 16;
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

  stylix.targets.alacritty.enable = false;

  xdg.configFile."alacritty/themes" = {
    source = builtins.fetchGit {
        url = "https://github.com/alacritty/alacritty-theme.git";
        rev = "95a7d695605863ede5b7430eb80d9e80f5f504bc";
    };
  };
}
