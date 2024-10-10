{
  imports = [
    ./docker.nix
    ./kind.nix
  ];

  virtualisation.containers.enable = true;
}
