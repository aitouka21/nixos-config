{ pkgs, ... }:

with pkgs; {
  programs.zsh = {
    enable = true;

    autocd = true;

    enableAutosuggestions = true;

    enableSyntaxHighlighting = true;

    shellAliases = {
      ls = "${exa}/bin/exa";
      fuck-build = "sudo nixos-rebuild switch --flake /home/wilson/nixos-config#home-pc";
    };

    oh-my-zsh = {
      enable = true;

      plugins = [
        "sudo"
        "git"
        "history"
      ];
    };

    plugins = [
      {
        name = "nix-shell";
        src = fetchFromGitHub {
          owner = "chisui";
          repo = "zsh-nix-shell";
          rev = "03a1487655c96a17c00e8c81efdd8555829715f8";
          sha256 = "1avnmkjh0zh6wmm87njprna1zy4fb7cpzcp8q7y03nw3aq22q4ms";
        };
      }

      {
        name = "geometry";
        file = "geometry.zsh-theme";
        src = fetchFromGitHub {
          owner = "geometry-zsh";
          repo = "geometry";
          rev = "d78d0daab3e16d19043fd225fe30bf38de3b33ad";
          sha256 = "S7WNIkgmsnUlSNCD+C67oKMhOiSwqluytGSG0eLYxWs=";
        };
      }

      {
        name = "solarized-man";
        src = fetchFromGitHub {
          owner = "zlsun";
          repo = "solarized-man";
          rev = "a902b64696271efee95f37d45589078fdfbbddc5";
          sha256 = "04gm4qm17s49s6h9klbifgilxv8i45sz3rg521dwm599gl3fgmnv";
        };
      }
    ];
  };

  programs.autojump = {
    enable = true;
    enableZshIntegration = true;
  };
}
