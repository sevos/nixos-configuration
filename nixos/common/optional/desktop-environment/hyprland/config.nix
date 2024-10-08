{lib,...}:
with lib;
{
  options.hyprland = {
    monitor = mkOption {
      type = types.listOf(types.str);
      default = [",preferred, auto, auto"];
    };
  };
}
