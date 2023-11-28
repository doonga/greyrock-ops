{ pkgs, ... }:
{
  users.users.todd.home = "/Users/todd";

  fonts.fontDir.enable = true;
  fonts.fonts = with pkgs; [
    font-awesome
    (nerdfonts.override {fonts = ["FiraCode"];})
  ];

  system.defaults = {
    finder.AppleShowAllExtensions = true;
    finder._FXShowPosixPathInTitle = true;
    NSGlobalDomain.AppleShowAllExtensions = true;
    NSGlobalDomain.InitialKeyRepeat = 14;
    NSGlobalDomain.KeyRepeat = 1;
  };
}
