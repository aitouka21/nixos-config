{ pkgs, ... }: {
  services.picom = {
    enable = true;

    backend = "glx";

    opacityRules = [
      "90:class_g = 'Alacritty'"
      "90:class_g = 'Code'"
    ];

    settings = {
      # round-borders = 12.0;
      # corner-radius = 12.0;
      # transparent-clipping = 0;
      # detect-rounded-corners = true;
      # rounded-corners-exclude = [
      #   "class_g = 'Rofi'"
      #   "class_g = 'Code'"
      # ];

      # blur settings
      blur = {
        method = "gaussian";
        size = 8;
        deviation = 3.0;
      };
    };
  };
}
