{stylix, pkgs, lib, ...}:
{
  imports = [
  ];

  stylix = {
    enable = true;
    polarity = "dark";
    image = lib.mkDefault ../../../style/wallpapers/b0ek3ocp4rud1.png;
    
    base16Scheme = ../../../style/tokyo-city-dark.yaml;

    fonts = {
      serif = {
        package = pkgs.dejavu_fonts;
        name = "Cantarrel"; # this is not a serif font - we override
      };

      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "Cantarell";
      };

      monospace = {
        package = (pkgs.unstable.nerd-fonts.caskaydia-mono);
        name = "CaskaydiaMono Nerd Font";
      };

      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };

      sizes = {
        applications = 15;
        terminal = 15;
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
