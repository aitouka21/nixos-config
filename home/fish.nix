{ pkgs, ... }:
{
  programs.fish = {
    enable = true;
  } // (import ./shellcommon.nix { inherit pkgs; });
}
