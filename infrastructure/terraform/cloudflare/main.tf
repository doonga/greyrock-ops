terraform {
  cloud {
    organization = "grey-rock"
    workspaces {
      name = "greyrock-cloudflare-provisioner"
    }
  }

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "4.19.0"
    }
    http = {
      source  = "hashicorp/http"
      version = "3.4.0"
    }
  }
}

# Obtain current home IP address
data "http" "ipv4_lookup_raw" {
  url = "http://ipv4.icanhazip.com"
}

data "vault_generic_secret" "cloudflare" {
  path  = "secrets/cloudflare"
}
