{ pkgs, inputs, ... }:
{
  home.packages = [
    inputs.ignis.packages.${pkgs.system}.ignis
  ];
}
