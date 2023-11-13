args@{ pkgs, pkgs-unstable, lib, config, ... }:
with lib;

let
  cfg = config.modules.users.todd;
in {
  imports = [
    ( import ../../home-manager { username="todd"; } )
  ];

  options.modules.users.todd = {
    enable = mkEnableOption "todd";
  };

  config = mkIf (cfg.enable) (mkMerge [
    (mkIf (pkgs.stdenv.isLinux) (import ./nixos.nix args))
    (mkIf (pkgs.stdenv.isDarwin) (import ./darwin.nix args))

    {
      users.users.todd = {
        shell = pkgs.fish;
      };

      modules.users.todd.home-manager.enable = true;

      modules.users.todd.sops = {
        defaultSopsFile = ./secrets.sops.yaml;
        secrets = {
          atuin_key = {
            path = "${config.home-manager.users.todd.xdg.configHome}/atuin/key";
          };
        };
      };

      modules.users.todd.shell.atuin = {
        enable = true;
        package = pkgs-unstable.atuin;
        sync_address = "https://atuin.greyrock.casa";
        config = {
          key_path = config.home-manager.users.todd.sops.secrets.atuin_key.path;
        };
      };

      modules.users.todd.shell.fish.enable = true;

      modules.users.todd.shell.git = {
        enable = true;
        username = "Todd Punderson";
        email = "tpunderson@greyrock.io";
        signing = {
          signByDefault = true;
          key = "0x80FF2B2CE4316DEE";
        };
        aliases = {
          co = "checkout";
          logo = "log --pretty=format:\"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ (%cn)\" --decorate";
        };
        config = {
          init = {
            defaultBranch = "main";
          };
        };
        ignores = [
          # Mac OS X hidden files
          ".DS_Store"
          # Windows files
          "Thumbs.db"
          # asdf
          ".tool-versions"
          # rtx
          ".rtx.toml"
          # Sops
          ".decrypted~*"
          # Python virtualenvs
          ".venv"
        ];
      };

      modules.users.todd.shell.rtx = {
        enable = true;
        package = pkgs-unstable.rtx;
      };

      modules.users.todd.shell.starship.enable = true;
      modules.users.todd.shell.tmux.enable = true;
    }
  ]);
}
