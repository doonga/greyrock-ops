resource "cloudflare_account" "greyrock" {
  name              = "Grey Rock"
  type              = "standard"
  enforce_twofactor = false
}
