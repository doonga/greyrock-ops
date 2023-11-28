{ username }: {pkgs, lib, config, talhelper, ... }:
with lib;

let
  cfg = config.modules.users.${username}.kubernetes.talhelper;

in {
  options.modules.users.${username}.kubernetes.talhelper = {
    enable = mkEnableOption "${username} talhelper";
    package = mkPackageOption talhelper "talhelper" { };

    enableFishIntegration = mkEnableOption "Fish Integration" // {
      default = true;
    };
  };

  config = mkIf cfg.enable {
    home-manager.users.${username} = {
      home.packages = [ cfg.package ];

      programs = {
        fish.interactiveShellInit = mkIf cfg.enableFishIntegration (
          ''
            ${getExe cfg.package} completion fish | source
            fish_add_path $HOME/.talhelper/bin
          ''
        );
      };
    };
  };
}
