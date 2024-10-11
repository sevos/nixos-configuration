{pkgs, ...}: {
    fonts = {
    # CaskaydiaMono Nerd Font
    packages = with pkgs; [
      (unstable.nerdfonts.override { fonts = [ "CascadiaMono" "CascadiaCode"]; })
    ];
  };
}
