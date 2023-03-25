module "cf_domain_ingress" {
  source     = "./modules/cf_domain"
  domain     = "greyrock.tech"
  account_id = cloudflare_account.greyrock.id
  dns_entries = [
    {
      name  = "ipv4"
      value = local.home_ipv4
    },
    {
      name  = "ingress"
      value = "ipv4.greyrock.tech"
      type  = "CNAME"
    },
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

resource "cloudflare_page_rule" "cf_domain_ingress_jellyfin_bypass_cache" {
  zone_id  = module.cf_domain_ingress.zone_id
  target   = format("jellyfin.%s/*", module.cf_domain_ingress.zone)
  status   = "active"
  priority = 2

  actions {
    cache_level         = "bypass"
    disable_performance = true
  }
}

resource "cloudflare_page_rule" "cf_domain_ingress_plex_bypass_cache" {
  zone_id  = module.cf_domain_ingress.zone_id
  target   = format("plex.%s/*", module.cf_domain_ingress.zone)
  status   = "active"
  priority = 1

  actions {
    cache_level         = "bypass"
    disable_performance = true
  }
}
