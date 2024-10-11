{pkgs, ...}:
{
  networking = {
    networkmanager = {
      enable = true;
    };
  };
  
  programs.nm-applet = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    networkmanagerapplet
  ];
}
