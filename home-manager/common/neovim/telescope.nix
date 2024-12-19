{
  programs.nixvim = {
    plugins.telescope = {
      enable = true;
      extensions = {
        file-browser.settings = {
          hidden = {
            file_browser = true;
            folder_browser = true;
          };
        };
      };
      keymaps = {
        "<leader><leader>" = {
           mode = "n";
	         action = "find_files";
           options.desc = "Find files in project";
        };
        "<leader>/" = {
	         mode = "n";
	         action = "live_grep";
           options.desc = "Grep in project";
        };
        "<leader>r" = {
	         mode = "n";
	         action = "oldfiles";
           options.desc = "Recent files";
        };
      };
    };

  };
}
