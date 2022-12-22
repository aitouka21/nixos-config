{ pkgs, ... }:
let
  realName = "Wilson Cheung";

  servers = {
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

  accounts.email.accounts = {
    zmail = servers.zmail // {
      inherit realName;
      primary = true;
      himalaya = {
        enable = true;

        settings = {
          backend = "imap";
          sender = "smtp";
        };
      };
      address = "wilson.cheung@offbeattech.com";
      userName = "wilson.cheung@offbeattech.com";
      passwordCommand = "pass show Offbeat/wilson.cheung@offbeattech.com";
    };
  };
}
