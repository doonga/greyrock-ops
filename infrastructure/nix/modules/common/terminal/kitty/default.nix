{ username }: {pkgs,lib, config, ... }:
with lib;

let
  cfg = config.modules.users.${username}.mac.kitty;

in {
  options.modules.users.${username}.mac.kitty = {
    enable = mkEnableOption "${username} kitty";
  };

  config = mkIf cfg.enable {
    home-manager.users.${username} = {
      programs.kitty = {
        enable = true;
        font = {
          name = "FiraCode Nerd Font";
          size = 16;
        };
        shellIntegration.enableFishIntegration = true;
        theme = "Catppuccin-Macchiato";
      };
    };
  };
}
