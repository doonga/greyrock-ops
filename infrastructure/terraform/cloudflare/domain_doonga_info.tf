module "cf_domain_doonga_info" {
  source     = "./modules/cf_domain"
  domain     = "doonga.info"
  account_id = cloudflare_account.greyrock.id
  plan_type  = "free"
  enable_email_routing = true
  email_catch_all_address = "tpunderson+doonga-info@greyrock.io"
  dns_entries = [
    # Cloudflare Email Routing
    {
      id       = "cloudflare_mx_1"
      name     = "@"
      priority = 81
      value    = "isaac.mx.cloudflare.net"
      type     = "MX"
    },
    {
      id       = "cloudflare_mx_2"
      name     = "@"
      priority = 45
      value    = "linda.mx.cloudflare.net"
      type     = "MX"
    },
    {
      id       = "cloudflare_mx_3"
      name     = "@"
      priority = 24
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
      value = "v=DMARC1; p=reject; sp=reject; adkim=s; aspf=s; rua=mailto:32f052da9f22432789b8cbcfac8b523b@dmarc-reports.cloudflare.net;"
      type  = "TXT"
    },
    {
      id    = "cloudflare_dkim"
      name  = "*._domainkey"
      value = "v=DKIM1; p="
      type  = "TXT"
    }
  ]
}
