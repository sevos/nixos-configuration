{pkgs, stylix, ...}:
{
  home.file."Obrazy/wallpaper.jpg" = {
    source = ./wallpaper.jpg;
  };

  stylix = {
    enable = true;
    image = ./wallpaper.jpg;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tomorrow-night.yaml";
  };
}

