{ username }: {pkgs, lib, config, talhelper, ... }:
with lib;

let
  cfg = config.modules.users.${username}.kubernetes.talhelper;

in {
  options.modules.users.${username}.kubernetes.talhelper = {
    enable = mkEnableOption "${username} talhelper";

    enableFishIntegration = mkEnableOption "Fish Integration" // {
      default = true;
    };
  };

  config = mkIf cfg.enable {
    home-manager.users.${username} = {
      home.packages = [ talhelper ];

      programs = {
        fish.interactiveShellInit = mkIf cfg.enableFishIntegration (
          ''
            ${getExe talhelper} completion fish | source
          ''
        );
      };
    };
  };
}
