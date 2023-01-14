resource "auth0_custom_domain" "auth0_greyrock_io" {
  domain = "auth0.greyrock.io"
  type   = "auth0_managed_certs"
}
