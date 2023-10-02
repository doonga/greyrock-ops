provider "github" {
  token = data.vault_generic_secret.github.data["pat_terraform"]
}

variable login_approle_role_id {}
variable login_approle_secret_id {}

provider "vault" {
  address = "https://vault.greyrock.io"
  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id = var.login_approle_role_id
      secret_id = var.login_approle_secret_id
    }
  }
}
