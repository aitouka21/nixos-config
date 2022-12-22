{ pkgs, ... }:
{
  imports = [
    #   ./rust.nix
  ];

  programs.neovim = {
    enable = true;

    coc = {
      enable = true;
    };

    plugins = with pkgs.vimPlugins; [
      sonokai
      dracula-vim
      gruvbox
      papercolor-theme
      tokyonight-nvim
      vim-nix
      vim-markdown
      himalaya-vim
    ];

    extraConfig = ''
      lua << EOF
      ${builtins.readFile ./neovim.lua}
      EOF
    '';

    extraPackages = [
      pkgs.nodejs
      pkgs.himalaya
    ];
  };
}
