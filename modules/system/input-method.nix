{ pkgs, ... }:
{
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.inputMethod = {

    enabled = "ibus";
    ibus.engines = with pkgs.ibus-engines; [
      mozc
      table-chinese
      table
      table-others
    ];
  };
}
