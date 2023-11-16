resource "helm_release" "vault" {
  name       = "vault"
  repository = "https://helm.releases.hashicorp.com"
  chart      = "vault"
  version    = "0.27.0"
  recreate_pods = "true"

  values = [
    "${file("values/vault.yaml")}"
  ]

  set {
    name = "server.extraEnvironmentVars.VAULT_TOKEN"
    value = "${data.sops_file.secrets.data["vault_token"]}"
  }
}

resource "kubernetes_secret_v1" "kms-vault-unseal" {
  metadata {
    name = "kms-vault-unseal"
  }

  data = {
    "serviceaccount.json" = "${data.sops_file.secrets.data["serviceaccount.json"]}"
  }
}
