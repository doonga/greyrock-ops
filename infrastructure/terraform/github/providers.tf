provider "github" {
  token = data.vault_generic_secret.github.data["pat_terraform"]
}

provider "vault" {
  address = "https://vault.greyrock.io"
  skip_child_token = true
}
