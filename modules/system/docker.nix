{ pkgs, ... }: {
  virtualisation.docker.enable = true;

  users.users.wilson = {
    extraGroups = [ "docker" ];
  };
}