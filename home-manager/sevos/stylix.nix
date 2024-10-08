{pkgs, stylix, ...}:
{
  home.file."Obrazy/wallpaper" = {
    source = ./wallpaper.jpg;
  };

  stylix = {
    enable = true;
    image = ./wallpaper.jpg;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tomorrow-night.yaml";
  };
}

