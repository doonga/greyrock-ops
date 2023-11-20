{ username }: {pkgs,lib, config, ... }:
with lib;

let
  cfg = config.modules.users.${username}.kubernetes.kubectl;

in {
  options.modules.users.${username}.kubernetes.kubectl = {
    enable = mkEnableOption "${username} kubectl";
    package = mkPackageOption pkgs "kubectl" { };
  };

  config = mkIf cfg.enable {
    home-manager.users.${username} = {
      home.packages = [ cfg.package ];
    };
  };
}
