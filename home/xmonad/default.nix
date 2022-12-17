# FIXME: don't know how to setup ide config correctly
{ pkgs ? import <nixpkgs> { } }:

pkgs.haskellPackages.developPackage {
  name = "my-xmonad";
  root = ./.;
  modifier = drv:
    pkgs.haskell.lib.addBuildTools drv (with pkgs.haskellPackages;
    [
      cabal-install
      cabal-fmt
      ghcid
      haskell-language-server
    ]);
}
