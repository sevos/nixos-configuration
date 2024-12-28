{ ... }:

{
  imports = [
    ./locale
    ./1password
    ./virtualisation
    ./printing.nix
    ./stylix
    ./firewall.nix
    ./bluetooth.nix
  ];

  nix.settings.trusted-users = [
    "root"
    "sevos"
    "zencargo"
  ];
}
