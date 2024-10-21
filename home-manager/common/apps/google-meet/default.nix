{lib, config, ...}:

{
  options = {
    google-meet = {
      enable = lib.mkEnableOption "Enable wfirma";
    };
  };

  config = lib.mkIf config.google-meet.enable {
    home.file = {
      "google-meet.desktop" = {
        source = ./app.desktop;
        target = "${config.home.homeDirectory}/.local/share/applications/google-meet.desktop";
      };

      "google-meet.png" = {
        source = ./icon.png;
        target = "${config.home.homeDirectory}/.local/share/icons/hicolor/48x48/apps/google-meet.png";
      };
    };
  };
}
