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

    zmail = {
      imap = {
        host = "zmail.offbeattech.com";
        port = 993;
      };
      smtp = {
        host = "zmail.offbeattech.com";
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

    offbeat = servers.zmail // {
      inherit realName;
      himalaya.enable = true;
      address = "wilson.cheung@offbeattech.com";
      userName = "wilson.cheung@offbeattech.com";
      passwordCommand = "echo 123";
    };
  };
}
