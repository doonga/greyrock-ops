{ pkgs, pkgs-unstable, myPkgs, ... }:
{
  home-manager.users.todd.home.packages = [
    # myPkgs.talhelper (currently in homebrew)
    pkgs.discord
    pkgs.pwgen
  ];
}
