{ pkgs, pkgs-unstable, myPkgs, ... }:
{
  home-manager.users.todd.home.packages = [
    pkgs.discord
    pkgs.pwgen
  ];
}
