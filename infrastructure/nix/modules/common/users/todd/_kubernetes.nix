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
  modules.users.todd.kubernetes.talhelper.enable = false;
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
}
