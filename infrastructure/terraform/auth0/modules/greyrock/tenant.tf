resource "auth0_tenant" "grey_rock" {
  friendly_name       = "Grey Rock"
  support_email       = "support@greyrock.io"
  support_url         = "https://www.greyrock.io/support"
  allowed_logout_urls = ["https://auth.greyrock.tech/oauth2/sign_out"]
}
