provider "cloudflare" {
  email   = data.vault_generic_secret.cloudflare.data["username"]
  api_key = data.vault_generic_secret.cloudflare.data["api-key"]
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
