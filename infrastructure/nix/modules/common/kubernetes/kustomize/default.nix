{ username }: {pkgs,lib, config, ... }:
with lib;

let
  cfg = config.modules.users.${username}.kubernetes.kustomize;

in {
  options.modules.users.${username}.kubernetes.kustomize = {
    enable = mkEnableOption "${username} kustomize";
    package = mkPackageOption pkgs "kustomize" { };
  };

  config = mkIf cfg.enable {
    home-manager.users.${username} = {
      home.packages = [ cfg.package ];
    };
  };
}
