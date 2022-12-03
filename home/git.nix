{ pkgs, ... }:
{
  programs.git = {
    package = pkgs.gitAndTools.gitFull;
    enable = true;
    userName  = "aitouka";
    userEmail = "wscheungae@gmail.com";
     aliases = {
      co = "checkout";
      aa = "add --all";
      cam = "commit -am";
      st = "status";
      b = "branch";
      l = "pull";
      p = "push";
    };
  };
}
