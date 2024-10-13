{pkgs, stylix, ...}:
{
  home.file."Obrazy/wallpaper.jpg" = {
    source = ./wallpaper.jpg;
  };

  stylix = {
    enable = true;
    image = ./wallpaper.jpg;
  };
}

