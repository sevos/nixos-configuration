{
  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "Artur Roszczyk";

    includes = [
      { path = "user"; }
    ];

    aliases = {
      co = "checkout";
      st = "status";
    };

    extraConfig = {
      core.autocrlf = "input";
      core.excludesfile = "$HOME/.config/git/gitignore_global";
      init.defaultBranch = "main";
    };
  };

  programs.gh.enable = true;
}
