{ pkgs, ... }: {
  imports = [
    ./fonts.nix
    ./vscode.nix
    ./docker.nix
    ./input-method.nix
  ];

  environment.systemPackages = with pkgs; [
    neofetch
    firefox
    chromium
    slack
    jq
    lsof
    pgcli
    awscli2
    stack
    git
    discord-canary

    haskellPackages.xmonad
    haskellPackages.xmonad-extras
    haskellPackages.xmonad-contrib
    haskellPackages.monad-logger
  ];

  networking.nameservers = [ "1.1.1.1" "8.8.8.8" ];

  nixpkgs.config.allowUnfree = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.windowManager.xmonad.enable = true;
  services.xserver.displayManager.defaultSession = "none+xmonad";
  services.xserver.displayManager.sessionCommands = ''
    xrandr --output DisplayPort-0 --pos 0x0 --output HDMI-A-0 --pos 0x1080
  '';

  # Enable the GNOME Desktop Environment.
  # services.xserver.displayManager.gdm.enable = true;
  # services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };
}
