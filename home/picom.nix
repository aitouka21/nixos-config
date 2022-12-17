{ pkgs, ... }: {
  services.picom = {
    enable = true;

    opacityRules = [
      "95:class_g = 'Alacritty'"
      "95:class_g = 'Code'"
    ];
  };
}
