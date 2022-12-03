{ pkgs, ... }:

{
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-mozc 
      fcitx5-table-extra 
      fcitx5-configtool
      fcitx5-gtk
      fcitx5-rime
      fcitx5-lua
      fcitx5-with-addons
      fcitx5-chinese-addons
    ];
  };
}