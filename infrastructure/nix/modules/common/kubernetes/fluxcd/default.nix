{ username }: {pkgs,lib, config, ... }:
with lib;

let
  cfg = config.modules.users.${username}.kubernetes.fluxcd;

in {
  options.modules.users.${username}.kubernetes.fluxcd = {
    enable = mkEnableOption "${username} fluxcd";
    package = mkPackageOption pkgs "fluxcd" { };
  };

  config = mkIf cfg.enable {
    home-manager.users.${username} = {
      home.packages = [ cfg.package ];
    };
  };
}
