resource "cloudflare_account" "Grey Rock" {
  name              = "Grey Rock Account"
  type              = "standard"
  enforce_twofactor = false
}
