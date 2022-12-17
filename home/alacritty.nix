{ pkgs, ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
      font.size = 10;
      window = {
        padding.x = 15;
        padding.y = 15;
      };

      colors = {
        primary = {
          background = "0x241e3d";
          foreground = "0xc0bbcb";
        };

        cursor = {
          text = "0x241e3d";
          cursor = "0xc0bbcb";
        };

        normal = {
          black = "0x241e3d";
          red = "0xd54e53";
          green = "0xb9ca4a";
          yellow = "0xe6c547";
          blue = "0x5b81f3";
          magenta = "0xc397d8";
          cyan = "0x70c0ba";
          white = "0xffffff";
        };

        bright = {
          black = "0x241e3d";
          red = "0xff3334";
          green = "0x9ec400";
          yellow = "0xe7c547";
          blue = "0x7aa6da";
          magenta = "0xb77ee0";
          cyan = "0x54ced6";
          white = "0xffffff";
        };

        dim = {
          black = "0x333333";
          red = "0xf2777a";
          green = "0x99cc99";
          yellow = "0xffcc66";
          blue = "0x6699cc";
          magenta = "0xcc99cc";
          cyan = "0x66cccc";
          white = "0xdddddd";
        };
      };
    };
  };
}
