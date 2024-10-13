{...}:

{
  imports = [
    ./locale
    ./neovim
    ./1password
    ./virtualisation
    ./printing.nix
    ./stylix
  ];

  nix.settings.trusted-users = [
    "root"
    "sevos"
    "zencargo"
  ];
}
