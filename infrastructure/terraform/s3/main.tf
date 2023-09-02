terraform {
  required_providers {
    b2 = {
      source  = "Backblaze/b2"
      version = "0.8.4"
    }

    minio = {
      source = "aminueza/minio"
      version = "1.17.2"
    }

    vault = {
      source = "hashicorp/vault"
      version = "3.20.0"
    }
  }
}

data "vault_generic_secret" "minio" {
  path  = "secrets/minio"
}
