{
  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "artur roszczyk";
    userEmail = "sevos@hey.com";

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
      credential."https://github.com".helper = "gh auth git-credential";
    };
  };
}
