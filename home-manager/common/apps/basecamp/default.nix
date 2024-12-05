{lib, config, ...}:

{
  options = {
    basecamp = {
      enable = lib.mkEnableOption "basecamp";
      url = lib.mkOption {
        type = lib.types.str;
        description = "Basecamp workspace URL";
        example = "https://3.basecamp.com/1234567";
      };
    };
  };

  config = lib.mkIf config.basecamp.enable {
    home.file = {
      "basecamp.desktop" = {
        text = ''
          [Desktop Entry]
          Type=Application
          Name=Basecamp
          Comment=Launch Basecamp
          Icon=${config.home.homeDirectory}/.local/share/icons/hicolor/48x48/apps/basecamp.png
          Exec=chromium --app="${config.basecamp.url}" %U
          Terminal=false
        '';
        target = "${config.home.homeDirectory}/.local/share/applications/basecamp.desktop";
      };

      "basecamp.png" = {
        source = ./icon.png;
        target = "${config.home.homeDirectory}/.local/share/icons/hicolor/48x48/apps/basecamp.png";
      };
    };
  };
}
