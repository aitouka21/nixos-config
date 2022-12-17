{ pkgs, ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        size = 10;

        normal = {
          family = "Fira Code";
          style = "Regular";
        };

        bold = {
          family = "Fira Code";
          style = "Bold";
        };

        italic = {
          family = "Fira Code";
          style = "Italic";
        };

        bold_italic = {
          family = "Fira Code";
          style = "Bold Italic";
        };
      };

      window = {
        padding.x = 15;
        padding.y = 15;
      };

      colors = {
        primary = {
          background = "#241e3d";
          foreground = "#c0bbcb";
        };

        cursor = {
          text = "#241e3d";
          cursor = "#c0bbcb";
        };

        normal = {
          black = "#444a73";
          red = "#fe719e";
          green = "#63ee92";
          yellow = "#fad13d";
          blue = "#8087ee";
          magenta = "#fc7b7b";
          cyan = "#86e1fc";
          white = "#d0d0d0";
        };

        bright = {
          black = "#828bb8";
          red = "#ff98a4";
          green = "#c3e88d";
          yellow = "#d1b959";
          blue = "#75bcff";
          magenta = "#ff966c";
          cyan = "#b4f9f8";
          white = "#b6b2c0";
        };
      };
    };
  };
}
