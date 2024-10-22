{lib,...}:
with lib;
{
  options.hyprland = {
    workspace = mkOption {
      type = types.listOf(types.str);
      default = [];
    };

    monitor-config = lib.mkOption {
      type = lib.types.attrsOf(lib.types.listOf(lib.types.str));
      default = {
        default = [",preferred, auto, auto"];
      };
    };
  };
}
