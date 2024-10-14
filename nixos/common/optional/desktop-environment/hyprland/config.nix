{lib,...}:
with lib;
{
  options.hyprland = {
    monitor = mkOption {
      type = types.listOf(types.str);
      default = [",preferred, auto, auto"];
    };
    workspace = mkOption {
      type = types.listOf(types.str);
      default = [];
    };
    env = mkOption {
      type = types.listOf(types.str);
      default = [];
    };
    xwayland = mkOption {
      type = types.attrs;
      default = {
        force_zero_scaling = mkOption {
          type = types.bool;
          default = false;
        };
      };
    };
  };
}
