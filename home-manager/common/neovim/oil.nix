{
  programs.nixvim = {
    plugins.oil.enable = true;

    keymaps = [
      {
        key = "-";
      	mode = "n";
	      action.__raw =  ''require("oil").toggle_float'';
      }
    ];
  };
}
