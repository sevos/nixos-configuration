{pkgs, ... }:

{
  imports = [
    ./pipewire.nix
    ./dbus.nix
    ./gnome-keyring.nix
  ];

  environment.systemPackages = with pkgs;
    [ 
      wayland
      (sddm-chili-theme.override {
        themeConfig = {
          #          background = config.stylix.image;
          ScreenWidth = 2560;
          ScreenHeight = 1600;
          blur = true;
          recursiveBlurLoops = 3;
          recursiveBlurRadius = 5;
      };})
    ];

  services.xserver = {
    enable = true;

    xkb = {
      layout = "pl";
      variant = "";
      options = "caps:escape";
    };
  };

  services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      enableHidpi = true;
      package = pkgs.sddm;
      
      sugarCandyNix = {
        enable  = true;

        settings = {
        #          Background = lib.cleanSource config.stylix.image;
          ScreenWidth = 2560;
          ScreenHeight = 1600;
          FormPosition = "left";
          HaveFormBackground = true;
          PartialBlur = true;
        };

      };
    };
}

