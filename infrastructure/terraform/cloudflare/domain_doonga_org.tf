module "cf_domain_doonga_org" {
  source     = "./modules/cf_domain"
  domain     = "doonga.org"
  account_id = cloudflare_account.greyrock.id
  plan_type  = "free"
  enable_email_routing = true
  email_catch_all_address = "tpunderson+doonga-org@greyrock.io"

  dns_entries = [
    # Cloudflare Email Routing
    {
      id       = "cloudflare_mx_1"
      name     = "@"
      priority = 8
      value    = "isaac.mx.cloudflare.net"
      type     = "MX"
    },
    {
      id       = "cloudflare_mx_2"
      name     = "@"
      priority = 14
      value    = "linda.mx.cloudflare.net"
      type     = "MX"
    },
    {
      id       = "cloudflare_mx_3"
      name     = "@"
      priority = 34
      value    = "amir.mx.cloudflare.net"
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
      value = "v=DMARC1; p=reject; sp=reject; adkim=s; aspf=s; rua=mailto:136f654a846544cfb1d2a0a7e301f8dc@dmarc-reports.cloudflare.net;"
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
      description = "Firewall rule to block certain countries"
      expression  = "(ip.geoip.country in {\"CN\" \"IN\" \"KP\" \"RU\"})"
      action      = "block"
    },
  ]
}
