{ username }: {pkgs,lib, config, ... }:
with lib;

let
  cfg = config.modules.users.${username}.kubernetes.talosctl;

in {
  options.modules.users.${username}.kubernetes.talosctl = {
    enable = mkEnableOption "${username} talosctl";
    package = mkPackageOption pkgs "talosctl" { };
  };

  config = mkIf cfg.enable {
    home-manager.users.${username} = {
      home.packages = [ cfg.package ];
    };
  };
}
