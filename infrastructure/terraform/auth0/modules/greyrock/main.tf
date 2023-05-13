terraform {
  required_providers {
    auth0 = {
      source = "auth0/auth0"
    }
    cloudflare = {
      source = "cloudflare/cloudflare"
    }
  }
}

variable "secrets" {
  description = "secrets"
  type        = any
}

provider "auth0" {
  domain        = var.secrets["auth0_domain"]
  client_id     = var.secrets["auth0_client_id"]
  client_secret = var.secrets["auth0_client_secret"]
}

provider "cloudflare" {
  api_token = var.secrets["cloudflare"]["api_token"]
}
