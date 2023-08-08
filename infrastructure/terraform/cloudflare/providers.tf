provider "cloudflare" {
  email   = data.vault_generic_secret.cloudflare.data["username"]
  api_key = data.vault_generic_secret.cloudflare.data["api-key"]
}

provider "vault" {
  address = "https://vault.greyrock.io"
  skip_child_token = true
}
