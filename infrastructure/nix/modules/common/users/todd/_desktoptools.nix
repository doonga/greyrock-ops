{ pkgs, pkgs-unstable, ... }:
{
  home-manager.users.todd.home.packages = [
    pkgs.discord
    pkgs.pwgen
  ];
}
