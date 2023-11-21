{ pkgs, pkgs-unstable, ... }:
{
  modules.users.todd.shell.rtx = {
    enable = true;
    package = pkgs-unstable.rtx;
  };

  home-manager.users.todd.home.packages = [
    pkgs.ansible
    pkgs.envsubst
    pkgs.go-task
    pkgs.jq
    pkgs.minio-client
    pkgs.terraform
    pkgs.vault
  ];
}
