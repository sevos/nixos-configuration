#This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{
  inputs,
  outputs,
  lib,
  config,
  ...
}:
{
  # You can import other NixOS modules here
  imports = [
    inputs.home-manager.nixosModules.home-manager

    # If you want to use modules your own flake exports (from modules/nixos):
    # outputs.nixosModules.example

    # Or modules from other flakes (such as nixos-hardware):
    # inputs.hardware.nixosModules.common-cpu-amd
    # inputs.hardware.nixosModules.common-ssd

    # You can also split up your configuration and import pieces of it here:
    ../common/optional/bootloader/uefi.nix
    ../common/optional/desktop-environment/gdm-gnome.nix
    ../common/optional/desktop-environment/hyprland
    ../common/optional/steam
    ../common

    # Import your generated (nixos-generate-config) hardware configuration
    ./hardware-configuration.nix
    # Power management
    ./power.nix
    ./ai.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
    };
  };

  nix =
    let
      flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
    in
    {
      settings = {
        # Enable flakes and new 'nix' command
        experimental-features = "nix-command flakes";
        # Opinionated: disable global registry
        flake-registry = "";
        # Workaround for https://github.com/NixOS/nix/issues/9574
        nix-path = config.nix.nixPath;
      };
      # Opinionated: disable channels
      channel.enable = false;

      # Opinionated: make flake registry and nix path match flake inputs
      registry = lib.mapAttrs (_: flake: { inherit flake; }) flakeInputs;
      nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
    };

  networking.hostName = "peon";

  boot.kernelParams = [
    "nvidia_drm.fbdev=1"
    "nvidia-drm.modeset=1"
    "module_blacklist=i915,nouveau"
  ];
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware = {
    nvidia = {
      modesetting.enable = true;
      powerManagement = {
        enable = true;
        finegrained = false;
      };
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
        version = "565.57.01";
        sha256_64bit = "sha256-buvpTlheOF6IBPWnQVLfQUiHv4GcwhvZW3Ks0PsYLHo=";
        sha256_aarch64 = lib.fakeSha256;
        openSha256 = "sha256-kQsvDgnxis9ANFmwIwB7HX5MkIAcpEEAHc8IBOLdXvk=";
        settingsSha256 = "sha256-kQsvDgnxis9ANFmwIwB7HX5MkIAcpEEAHc8IBOLdXvk=";
        persistencedSha256 = lib.fakeSha256;
      };
    };

    graphics = {
      enable = true;
    };
  };

  users.users = {
    sevos = {
      description = "Artur Roszczyk";
      initialPassword = "qwerty";
      isNormalUser = true;
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIExyXjEYs7lfRDR30HgnzvHMGR15OKoOEXmm1fgJmeJS"
      ];
    };

    zencargo = {
      description = "Zencargo";
      initialPassword = "qwerty";
      isNormalUser = true;
      openssh.authorizedKeys.keys = [
      ];
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
    };
  };

  home-manager = {
    extraSpecialArgs = {
      inherit inputs outputs;
      machine-config = config;
    };
    users = {
      # Import your home-manager configuration
      sevos = import ../../home-manager/sevos/home.nix;
      zencargo = import ../../home-manager/zencargo/home.nix;
    };
  };

  hyprland.monitor-config = {
    default = [
      "DP-1, 3840x2160@144, 0x0, 2"
      # ((3840 / 2) - (3840 / 3)) / 2 = 320 - this horizontally centers both screens
      "HDMI-A-1, 3840x2160@144, 320x-720, 3"
    ];
    mirror = [
      "DP-1, 3840x2160@144, 0x0, 2"
      "HDMI-A-1, preferred, auto, 2, mirror, DP-1"
    ];
    games = [
      "DP-1, 3840x2160@144, 0x0, 1"
      "HDMI-A-1, disable"
    ];
  };

  hyprland.workspace = [
    "name:Top, monitor:HDMI-A-1, default:true"
    "1, monitor:DP-1, default:true"
    "2, monitor:DP-1"
    "3, monitor:DP-1"
    "4, monitor:DP-1"
    "5, monitor:DP-1"
    "6, monitor:DP-1"
    "7, monitor:DP-1"
    "8, monitor:DP-1"
    "8, monitor:DP-1"
    "10, monitor:DP-1"
  ];

  # This setups a SSH server. Very important if you're setting up a headless system.
  # Feel free to remove if you don't need it.
  services.openssh = {
    enable = true;
    settings = {
      # Opinionated: forbid root login through SSH.
      PermitRootLogin = "no";
      # Opinionated: use keys only.
      # Remove if you want to SSH using passwords
      PasswordAuthentication = false;
    };
  };

  networking.nameservers = [
    "127.0.0.1"
    "10.42.0.53"
    "1.1.1.1"
    "8.8.8.8"
  ];

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.05";
}
