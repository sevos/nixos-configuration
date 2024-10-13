{stylix, pkgs, ...}:
{
  imports = [
  ];

  stylix = {
    enable = true;
    polarity = "dark";
    image = ../../../style/wallpapers/stars-02.jpg;
    
    base16Scheme = ../../../style/tokyo-dark.yaml;

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
        package = (pkgs.unstable.nerdfonts.override { fonts = [ "CascadiaMono" "CascadiaCode"]; });
        name = "CaskaydiaMono Nerd Font";
      };

      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };

    targets = {
      grub = {
        enable = true;
        useImage = true;
      };
      gtk.enable = true;
      gnome.enable = true;
    };

  };
}
