provider "github" {
  token = data.vault_generic_secret.github.data["pat_terraform"]
}

variable role_id {}
variable secret_id {}

provider "vault" {
  address = "https://vault.greyrock.io"
  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id = var.role_id
      secret_id = var.secret_id
    }
  }
}
