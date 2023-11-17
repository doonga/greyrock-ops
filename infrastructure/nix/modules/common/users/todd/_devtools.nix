{ pkgs, pkgs-unstable, ... }:
{
  modules.users.todd.shell.rtx = {
    enable = true;
    package = pkgs-unstable.rtx;
  };

  home-manager.users.todd.home.packages = [
    pkgs.envsubst
    pkgs.go-task
  ];
}
