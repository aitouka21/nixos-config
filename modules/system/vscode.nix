{ pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    # (vscode-with-extensions.override
    #  { vscodeExtensions = with vscode-extensions; [ ms-vsliveshare.vsliveshare ]; })
    vscode
  ];

  # https://code.visualstudio.com/docs/setup/linux#_visual-studio-code-is-unable-to-watch-for-file-changes-in-this-large-workspace-error-enospc
  boot.kernel.sysctl = {
    "fs.inotify.max_user_watches" = "524288";
  };
}
