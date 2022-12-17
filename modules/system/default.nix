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
  ];

  networking.nameservers = [ "1.1.1.1" "8.8.8.8" ];

  nixpkgs.config.allowUnfree = true;

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
}
