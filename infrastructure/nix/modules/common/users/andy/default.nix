{ pkgs, lib, config, ... }:
with lib;

let
  cfg = config.modules.users.andy;
in {
  options.modules.users.andy = {
    enable = mkEnableOption "andy";
  };

  config = mkIf (cfg.enable) (mkMerge [
    (mkIf (pkgs.stdenv.isLinux) (import ./nixos.nix {inherit config;}))
    (mkIf (pkgs.stdenv.isDarwin) (import ./darwin.nix {inherit config;}))
  ]);
}
