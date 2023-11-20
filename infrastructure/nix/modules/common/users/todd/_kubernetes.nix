{
  modules.users.todd.kubernetes.k9s.enable = true;
  modules.users.todd.kubernetes.krew.enable = true;
  modules.users.todd.kubernetes.kubecm.enable = true;
  modules.users.todd.kubernetes.stern.enable = true;
  modules.users.todd.kubernetes.helm.enable = true;

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
