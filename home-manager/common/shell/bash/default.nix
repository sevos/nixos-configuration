{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
      
      # It was not possible to set these aliases via programs.bash.shellAliases
      alias ..="cd .."
      alias ...="cd ../.."
      alias ....="cd ../../.."
    '';
  };
}
