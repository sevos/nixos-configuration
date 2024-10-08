{stylix, pkgs, ...}:
{
  imports = [
  ];

  stylix.enable = true;
  stylix.image = ../../../home-manager/sevos/wallpaper.jpg;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/tomorrow-night.yaml";
}
