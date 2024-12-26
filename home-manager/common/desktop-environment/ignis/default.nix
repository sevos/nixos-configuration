{ pkgs, inputs, ... }:
{
  home.packages = [
    (inputs.ignis.packages.${pkgs.system}.ignis.overrideAttrs (old: {
      buildInputs = old.buildInputs ++ [
        pkgs.python312Packages.materialyoucolor
        pkgs.python312Packages.jinja2
        pkgs.python312Packages.pillow
      ];
    }))
  ];

  xdg.configFile."ignis" = {
    source = ./config;
  };
}
