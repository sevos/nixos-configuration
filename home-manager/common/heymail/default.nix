{lib, config, ...}:

{
  options = {
    heymail = {
      enable = lib.mkEnableOption "hey";
    };
  };

  config = lib.mkIf config.heymail.enable {
    home.file = {
      "hey.desktop" = {
        source = ./hey.desktop;
        target = "${config.home.homeDirectory}/.local/share/applications/hey.desktop";
      };

      "hey.png" = {
        source = ./hey.png;
        target = "${config.home.homeDirectory}/.local/share/icons/hicolor/48x48/apps/hey.png";
      };
    };
  };
}
