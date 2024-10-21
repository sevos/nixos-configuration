{lib, config, ...}:

{
  options = {
    wfirma = {
      enable = lib.mkEnableOption "Enable wfirma";
    };
  };

  config = lib.mkIf config.wfirma.enable {
    home.file = {
      "app.desktop" = {
        source = ./app.desktop;
        target = "${config.home.homeDirectory}/.local/share/applications/wfirma.desktop";
      };

      "icon.png" = {
        source = ./icon.png;
        target = "${config.home.homeDirectory}/.local/share/icons/hicolor/48x48/apps/wfirma.png";
      };
    };
  };
}
