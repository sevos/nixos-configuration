{stylix, pkgs, ...}:
{
  imports = [
  ];

  stylix = {
    enable = true;
    image = ../../../home-manager/sevos/wallpaper.jpg;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tomorrow-night.yaml";

    fonts = {
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };

      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };

      monospace = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans Mono";
      };

      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };
  };
}
