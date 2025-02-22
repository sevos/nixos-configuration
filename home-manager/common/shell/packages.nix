{ pkgs, ... }:
{
  home.packages = (
    with pkgs;
    [
      git
      gh
      lazygit
      gcc13
      gnumake
      # here is some command line tools I use frequently
      # feel free to add your own or remove some of them

      # neofetch
      nnn # terminal file manager

      # archives
      zip
      xz
      unzip
      p7zip

      # utils
      ripgrep # recursively searches directories for a regex pattern
      jq # A lightweight and flexible command-line JSON processor
      yq-go # yaml processor https://github.com/mikefarah/yq
      fzf # A command-line fuzzy finder

      # networking tools
      # mtr # A network diagnostic tool
      # iperf3
      dnsutils # `dig` + `nslookup`
      # ldns # replacement of `dig`, it provide the command `drill`
      # aria2 # A lightweight multi-protocol & multi-source command-line download utility
      socat # replacement of openbsd-netcat
      nmap # A utility for network discovery and security auditing
      # ipcalc  # it is a calculator for the IPv4/v6 addresses

      # misc
      # cowsay
      # file
      # which
      # tree
      # gnused
      # gnutar
      # gawk
      # zstd
      # gnupg

      # nix related
      #
      # it provides the command `nom` works just like `nix`
      # with more details log output
      nix-output-monitor
      nh

      # productivity
      # hugo # static site generator
      # glow # markdown previewer in terminal

      btop # replacement of htop/nmon
      iotop # io monitoring
      iftop # network monitoring

      # system call monitoring
      # strace # system call monitoring
      # ltrace # library call monitoring
      # lsof # list open files

      # system tools
      sysstat
      lm_sensors # for `sensors` command
      ethtool
      pciutils # lspci
      usbutils # lsusb

      # NodeJS
      nodejs_20
      yarn

      # Ruby 3.3
      (ruby_3_3.withPackages (
        p: with p; [
          (bundler.override { ruby = ruby_3_3; })
        ]
      ))
      libyaml

      # Nil lang
      nil

      # Rust
      cargo

      # Python
      python3
      python312Packages.pip
      python312Packages.ollama
      python312Packages.duckduckgo-search
      python312Packages.yfinance
      python312Packages.pypdf
      python312Packages.sqlalchemy
      python312Packages.fastapi
      python312Packages.youtube-transcript-api
    ]
  );
}
