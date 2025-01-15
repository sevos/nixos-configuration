{ ... }:

{
  imports = [
    ./locale
    ./1password
    ./virtualisation
    ./printing.nix
    ./stylix
    ./dns.nix
    ./firewall.nix
    ./bluetooth.nix
  ];

  nix.settings.trusted-users = [
    "root"
    "sevos"
    "zencargo"
  ];
}
