{ pkgs, ... }:
{
  shellAliases = {
    git = "${pkgs.git}/bin/git";
    g = "git";
    gco = "git checkout";
    gaa = "git add --all";
    gcam = "git commit -am";
    gst = "git status";
    gb = "git branch";
    gl = "git pull";
    gp = "git push";
    grbc = "git rebase --continue";
    grbi = "git rebase -i";
    gsta = "git stash push";
    gstaa = "git stash apply";
    gpsup = "git push --set-upstream origin $(git_current_branch)";
    ls = "${pkgs.exa}/bin/exa";
  };
}