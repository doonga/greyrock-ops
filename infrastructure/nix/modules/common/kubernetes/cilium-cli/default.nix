{ username }: {pkgs,lib, config, ... }:
with lib;

let
  cfg = config.modules.users.${username}.kubernetes.cilium-cli;

in {
  options.modules.users.${username}.kubernetes.cilium-cli = {
    enable = mkEnableOption "${username} cilium-cli";
    package = mkPackageOption pkgs "cilium-cli" { };
  };

  config = mkIf cfg.enable {
    home-manager.users.${username} = {
      home.packages = [ cfg.package ];
    };
  };
}
