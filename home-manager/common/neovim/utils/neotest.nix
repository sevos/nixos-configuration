{ pkgs, ... }:
{
  programs.nixvim = {
    plugins.neotest = {
      enable = true;
      adapters = {
        rspec.enable = true;
        minitest = {
          enable = true;
          package = pkgs.unstable.vimPlugins.neotest-minitest;
        };
      };
    };
  };
}
