{...}:

{
  imports = [
    ./locale
    ./1password
    ./virtualisation
    ./printing.nix
    ./stylix
    ./firewall.nix
  ];

  nix.settings.trusted-users = [
    "root"
    "sevos"
    "zencargo"
  ];
}
