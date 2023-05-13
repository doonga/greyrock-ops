resource "auth0_email" "mailgun_provider" {
  name    = "mailgun"
  enabled = true

  default_from_address = "Grey Rock authentication <noreply@m.greyrock.io>"

  credentials {
    domain    = "m.greyrock.io"
    region    = null
    smtp_port = 0
    api_key   = var.secrets["mailgun"]["api_key"]
  }
}
