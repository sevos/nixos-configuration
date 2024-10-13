{pkgs, stylix, ...}:
{
  home.file."Obrazy/wallpaper.jpg" = {
    source = ../../style/wallpapers/stars-02.jpg;
  };

  stylix = {
    enable = true;

    targets = {
      fzf.enable = true;
      gedit.enable = true;
      hyprland.enable = true;
      k9s.enable = true;
      lazygit.enable = true;
      waybar.enable = true;
      xresources.enable = true;
    };
  };
}

