{ pkgs, talhelper,  ...}:
let
   vscode-extensions = (import ../../editor/vscode/extensions.nix){pkgs = pkgs;};
 in
{
  modules.users.todd.kubernetes.cilium-cli.enable = true;
  modules.users.todd.kubernetes.fluxcd.enable = true;
  modules.users.todd.kubernetes.helm.enable = true;
  modules.users.todd.kubernetes.k9s.enable = true;
  modules.users.todd.kubernetes.krew.enable = true;
  modules.users.todd.kubernetes.kubecm.enable = true;
  modules.users.todd.kubernetes.kubectl.enable = true;
  modules.users.todd.kubernetes.kustomize.enable = true;
  modules.users.todd.kubernetes.stern.enable = true;
  modules.users.todd.kubernetes.talhelper.enable = true;
  modules.users.todd.kubernetes.talosctl.enable = true;


  modules.users.todd.shell.fish = {
    config.programs.fish = {
      shellAliases = {
        k = "kubectl";
      };
      interactiveShellInit = ''
        flux completion fish | source
      '';
    };
  };

  modules.users.todd.editor.vscode = {
    extensions = with vscode-extensions; [
      ms-kubernetes-tools.vscode-kubernetes-tools
    ];

    config = {
      vs-kubernetes = {
        "vs-kubernetes.crd-code-completion" = "disabled";
      };
    };
  };
}
