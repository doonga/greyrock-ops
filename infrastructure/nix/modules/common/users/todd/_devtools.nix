{ pkgs, pkgs-unstable, ... }:

let
  vscode-extensions = (import ../../editor/vscode/extensions.nix){pkgs = pkgs;};
in
{
  modules.users.todd.editor.vscode = {
    enable = true;
    package = pkgs-unstable.vscode;

    extensions = (with vscode-extensions; [
      eamodio.gitlens
      golang.go
      fnando.linter
      hashicorp.terraform
      jnoortheen.nix-ide
      ms-vscode-remote.remote-containers
      ms-vscode-remote.remote-ssh
      redhat.ansible
      ms-python.python
      ms-python.vscode-pylance
    ]);

    config = {
      # Extension settings
      ansible = {
        python.interpreterPath = ".venv/bin/python";
      };

      linter = {
        linters = {
          yamllint = {
            configFiles = [
              ".yamllint.yml"
              ".yamllint.yaml"
              ".yamllint"
              ".ci/yamllint/.yamllint.yaml"
            ];
          };
        };
      };

      qalc = {
        output.displayCommas = false;
        output.precision = 0;
        output.notation = "auto";
      };
    };
  };

  modules.users.todd.shell.rtx = {
    enable = true;
    package = pkgs-unstable.rtx;
  };

  home-manager.users.todd.home.packages = [
    pkgs.ansible
    pkgs.envsubst
    pkgs.go-task
    pkgs.minio-client
    pkgs.terraform
    pkgs.vault
  ];
}
