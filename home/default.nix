{ ... }:
{
  imports = [
    ./git.nix
    ./zsh.nix
    ./alacritty.nix
    ./termonad/termonad.nix
    ./direnv.nix
    ./email.nix
    ./xmonad/xmonad.nix
    ./rofi/rofi.nix
    ./picom.nix
    ./neovim/neovim.nix
  ];
}
