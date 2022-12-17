{ pkgs, ... }:
let
  realName = "Wilson Cheung";

  servers = {
    gmail = {
      imap = {
        host = "imap.gmail.com";
        port = 993;
        tls.useStartTls = true;
      };
      smtp = {
        host = "smtp.gmail.com";
        port = 465;
      };
    };
  };
in
{
  programs.himalaya = {
    enable = true;
  };

  # FIXME: Error: cannot parse config file, missing field `backend`
  accounts.email.accounts = {
    gmail = servers.gmail // {
      inherit realName;
      primary = true;
      himalaya.enable = true;
      himalaya.backend = "imap";
      address = "wscheungae@gmail.com";
      userName = "wscheungae@gmail.com";
      passwordCommand = "echo 123";
    };
  };
}
