# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example'
pkgs: {
  # example = pkgs.callPackage ./example { };
  nix-npm-buildpackage = pkgs.callPackage ./nix-npm-buildpackage { };
#  rancher-desktop = pkgs.callPackage ./rancher-desktop { };
}
