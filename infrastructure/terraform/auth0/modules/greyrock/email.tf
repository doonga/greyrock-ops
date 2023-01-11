resource "auth0_email" "mailgun_provider" {
  name    = "mailgun"
  enabled = true

  default_from_address = "bjw-s authentication <noreply@m.greyrock.io>"

  credentials {
    domain    = "m.grerock.io"
    region    = "us"
    smtp_port = 0
    api_key   = var.secrets["mailgun"]["api_key"]
  }
}
