{ pkgs, ... }: {
  imports = [
    ./fonts.nix
    ./vscode.nix
    ./docker.nix
  ];

  environment.systemPackages = with pkgs; [
    neofetch
    firefox
    discord
  ];

  i18n.defaultLocale = "en_HK.UTF-8";

  networking.nameservers = [ "1.1.1.1" "8.8.8.8" ];

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Speed up boot
  # https://discourse.nixos.org/t/boot-faster-by-disabling-udev-settle-and-nm-wait-online/6339
  systemd.services.systemd-udev-settle.enable = false;
  systemd.services.NetworkManager-wait-online.enable = false;

}
