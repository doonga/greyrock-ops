module "cf_domain_validatemydomain" {
  source     = "./modules/cf_domain"
  domain     = "validatemydomain.com"
  account_id = cloudflare_account.greyrock.id
  plan_type  = "free"
  enable_email_routing = true
  email_catch_all_address = "tpunderson+validatemydomain@greyrock.io"

  dns_entries = [
    # Cloudflare Email Routing
    {
      id       = "cloudflare_mx_1"
      name     = "@"
      priority = 81
      value    = "route1.mx.cloudflare.net"
      type     = "MX"
    },
    {
      id       = "cloudflare_mx_2"
      name     = "@"
      priority = 63
      value    = "route2.mx.cloudflare.net"
      type     = "MX"
    },
    {
      id       = "cloudflare_mx_3"
      name     = "@"
      priority = 87
      value    = "route3.mx.cloudflare.net"
      type     = "MX"
    },
    {
      id    = "cloudflare_spf"
      name  = "@"
      value = "v=spf1 include:_spf.mx.cloudflare.net -all"
      type  = "TXT"
    },
    {
      id    = "cloudflare_dmarc"
      name  = "_dmarc"
      value = "v=DMARC1; p=reject; sp=reject; adkim=s; aspf=s; rua=mailto:f7c78cf7d42547b49cfdfcefc8d4cdb3@dmarc-reports.cloudflare.net;"
      type  = "TXT"
    },
    {
      id    = "cloudflare_dkim"
      name  = "*._domainkey"
      value = "v=DKIM1; p="
      type  = "TXT"
    }
  ]

  waf_custom_rules = [
    {
      enabled     = true
      description = "Firewall rule to block bots and threats determined by CF"
      expression  = "(cf.client.bot) or (cf.threat_score gt 14)"
      action      = "block"
    },
    {
      enabled     = true
      description = "Firewall rule to block all countries except US"
      expression  = "(ip.geoip.country ne \"US\")"
      action      = "block"
    },
  ]
}
