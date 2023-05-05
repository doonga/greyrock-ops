module "cf_domain_ingress" {
  source     = "./modules/cf_domain"
  domain     = "greyrock.tech"
  account_id = cloudflare_account.greyrock.id
  plan_type  = "pro"
  enable_email_routing = true
  email_catch_all_address = "tpunderson+greyrock-tech@greyrock.io"
  dns_entries = [
    # Generic settings
    {
      name  = "_dmarc"
      value = "v=DMARC1; p=reject; rua=mailto:3iucjkde@ag.us.dmarcian.com;"
      type  = "TXT"
    },
    {
      id    = "ingress_spf"
      name  = "@"
      value = "v=spf1 -all"
      type  = "TXT"
    },
    {
      id    = "azure_validator"
      name  = "@"
      value = "MS=ms17505606"
      type  = "TXT"
    },
  ]
}

# Allow Flux Webhook to access zone
resource "cloudflare_filter" "cf_domain_ingress_github_flux_webhook" {
  zone_id     = module.cf_domain_ingress.zone_id
  description = "Allow GitHub flux API"
  expression  = "(ip.geoip.asnum eq 36459 and http.host eq \"flux-receiver-greyrock-ops.greyrock.tech\")"
}

resource "cloudflare_firewall_rule" "cf_domain_ingress_github_flux_webhook" {
  zone_id     = module.cf_domain_ingress.zone_id
  description = "Allow GitHub flux API"
  filter_id   = cloudflare_filter.cf_domain_ingress_github_flux_webhook.id
  action      = "allow"
  priority    = 1
}
