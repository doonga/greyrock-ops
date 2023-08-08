provider "minio" {
  alias  = "nas"
  minio_server   = "s3.greyrock.io:9000"
  minio_user     = data.vault_generic_secret.minio.data["root_username"]
  minio_password = data.vault_generic_secret.minio.data["root_password"]
}

provider "vault" {
  address = "https://vault.greyrock.io"
}
