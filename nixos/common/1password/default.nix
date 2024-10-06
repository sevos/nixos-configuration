{ pkgs, ...}: {

  programs._1password-gui = {
    polkitPolicyOwners = [ "sevos" ];
  };

  environment.systemPackages = with pkgs.unstable; [
    _1password
    _1password-gui
  ];
}
