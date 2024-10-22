{ config, machine-config, lib, pkgs, ... }:

{
  options = {
    hyprland.settings.monitor-config = lib.mkOption {
      type = lib.types.attrsOf(lib.types.listOf(lib.types.str));
      default = {
        default = [",preferred, auto, 1"];
      };
    };
  };

  imports = [
    ./install.nix
  ];

  # for each monitor config create a file named as the config name
  config = {
    home.file = lib.attrsets.mapAttrs' (
      name: 
      monitorConfig:
      lib.attrsets.nameValuePair 
      (".config/hypr/monitor-config/${name}.conf")
      ({
        text = lib.concatStringsSep "\n" (map (line: "monitor = ${line}") monitorConfig);
      })
    ) (machine-config.hyprland.monitor-config);
  };
}

