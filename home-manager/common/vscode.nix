{ pkgs, lib, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    
    extensions = with pkgs.vscode-extensions; [
      # Ruby support
      rebornix.ruby
      
      # Continue.dev extension
      (pkgs.vscode-utils.buildVscodeMarketplaceExtension {
        mktplcRef = {
          name = "continue";
          publisher = "continue";
          version = "1.1.4";
          sha256 = "sha256-NhWzjCG+85T2K5cZSiT0kxP5EMDx7ZDixCS27JGYkp0=";
        };
      })
      
      # Ruby LSP
      shopify.ruby-lsp
      
      # Other useful extensions
      eamodio.gitlens
      ms-vsliveshare.vsliveshare
      streetsidesoftware.code-spell-checker
    ];
    
    userSettings = {
      "editor.fontFamily" = lib.mkForce "'JetBrains Mono', 'Droid Sans Mono', 'monospace'";
      "editor.fontSize" = lib.mkForce 18;
      "editor.formatOnSave" = lib.mkForce true;
      "editor.renderWhitespace" = lib.mkForce "boundary";
      "editor.rulers" = lib.mkForce [ 80 120 ];
      "editor.tabSize" = lib.mkForce 2;
      "files.trimTrailingWhitespace" = lib.mkForce true;
      "terminal.integrated.fontFamily" = lib.mkForce "'JetBrains Mono'";
      "workbench.colorTheme" = lib.mkForce "Default Dark Modern";
      
      # Ruby settings
      "ruby.useBundler" = lib.mkForce true;
      "ruby.useLanguageServer" = lib.mkForce true;
      "ruby.lint" = lib.mkForce {
        "rubocop" = true;
      };
      
      # Continue.dev settings
      "continue.telemetry" = lib.mkForce false;
    };
  };
} 