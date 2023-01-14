resource "auth0_custom_domain" "auth0_greyrock_io" {
  domain = "auth0.greyrock.io"
  type   = "auth0_managed_certs"
}

resource "auth0_custom_domain_verification" "auth0_greyrock_io_verification" {
  depends_on = [cloudflare_record.auth0_greyrock_io]

  custom_domain_id = auth0_custom_domain.my_custom_domain.id

  timeouts { create = "15m" }
}

module "cf_domain_main" {
  source     = "./modules/cf_domain"
  domain     = "greyrock.io"
  account_id = cloudflare_account.greyrock.id
  dns_entries = [
    {
      id      = "auth0_greyrock_io"
      name    = auth0_custom_domain.auth0_custom_domain.domain
      value   = auth0_custom_domain.auth0_custom_domain.verification[0].methods[0].record
      type    = "CNAME"
      proxied = false
    },
  ]
}
