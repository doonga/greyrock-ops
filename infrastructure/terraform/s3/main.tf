terraform {
  required_providers {
    b2 = {
      source  = "Backblaze/b2"
      version = "0.8.4"
    }

    minio = {
      source = "aminueza/minio"
      version = "2.0.1"
    }

    vault = {
      source = "hashicorp/vault"
      version = "3.22.0"
    }
  }
}

data "vault_generic_secret" "minio" {
  path  = "secrets/minio"
}
