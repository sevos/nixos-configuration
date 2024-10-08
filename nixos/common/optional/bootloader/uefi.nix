{pkgs, ...}:
{
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.gfxmodeEfi = "2560x1600";
  boot.loader.grub.font = "${pkgs.hack-font}/share/fonts/hack/Hack-Regular.ttf";
  boot.loader.grub.fontSize = 36;
  boot.loader.grub.useOSProber = true;
  boot.loader.efi.canTouchEfiVariables = true;
}
