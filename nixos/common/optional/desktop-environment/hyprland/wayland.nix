{pkgs, ... }:

{
  imports = [
    # ./pipewire.nix
    ./dbus.nix
    ./gnome-keyring.nix
  ];

  environment.systemPackages = with pkgs;
    [ 
      wayland
    ];

  services.xserver = {
    enable = true;

    xkb = {
      layout = "pl";
      variant = "";
      options = "caps:escape";
    };
  };
}

