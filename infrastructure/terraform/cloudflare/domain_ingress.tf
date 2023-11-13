module "cf_domain_ingress" {
  source     = "./modules/cf_domain"
  domain     = "greyrock.casa"
  account_id = cloudflare_account.greyrock.id
  plan_type  = "free"
  enable_email_routing = true
  email_catch_all_address = "tpunderson+greyrock-casa@greyrock.io"

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
      priority = 53
      value    = "route2.mx.cloudflare.net"
      type     = "MX"
    },
    {
      id       = "cloudflare_mx_3"
      name     = "@"
      priority = 34
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
      value = "v=DMARC1; p=reject; sp=reject; adkim=s; aspf=s; rua=mailto:9ff38b3b2fea437ca0ec34207b72df2d@dmarc-reports.cloudflare.net;"
      type  = "TXT"
    },
    {
      id    = "cloudflare_dkim"
      name  = "*._domainkey"
      value = "v=DKIM1; p="
      type  = "TXT"
    },
    {
      id    = "azure_validator"
      name  = "@"
      value = "MS=ms17505606"
      type  = "TXT"
    },
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
      description = "Firewall rule to block certain countries"
      expression  = "(ip.geoip.country in {\"CN\" \"IN\" \"KP\" \"RU\"})"
      action      = "block"
    },
  ]

}
