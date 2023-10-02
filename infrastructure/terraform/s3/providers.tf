provider "minio" {
  alias  = "nas"
  minio_server   = "s3.greyrock.io:9000"
  minio_user     = data.vault_generic_secret.minio.data["root_username"]
  minio_password = data.vault_generic_secret.minio.data["root_password"]
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
