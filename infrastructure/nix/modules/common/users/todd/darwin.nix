{ pkgs, ... }:
{
  users.users.todd.home = "/Users/todd";

  fonts.fontDir.enable = true;
  fonts.fonts = [(pkgs.nerdfonts.override {fonts = ["FireCode Nerd Font" "Font Awesome 6 Free Solid"];})];

  system.defaults = {
    finder.AppleShowAllExtensions = true;
    finder._FXShowPosixPathInTitle = true;
    NSGlobalDomain.AppleShowAllExtensions = true;
    NSGlobalDomain.InitialKeyRepeat = 14;
    NSGlobalDomain.KeyRepeat = 1;
  };
}
