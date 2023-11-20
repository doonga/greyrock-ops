{ username }: {pkgs,lib, config, ... }:
with lib;

let
  cfg = config.modules.users.${username}.kubernetes.helm;

in {
  options.modules.users.${username}.kubernetes.helm = {
    enable = mkEnableOption "${username} helm";
    package = mkPackageOption pkgs "kubernetes-helm" { };
  };

  config = mkIf cfg.enable {
    home-manager.users.${username} = {
      home.packages = [ cfg.package ];
    };
  };
}
