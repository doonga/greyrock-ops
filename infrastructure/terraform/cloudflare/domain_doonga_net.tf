module "cf_domain_doonga_net" {
  source     = "./modules/cf_domain"
  domain     = "doonga.net"
  account_id = cloudflare_account.greyrock.id
  plan_type  = "free"
  enable_email_routing = true
  email_catch_all_address = "tpunderson+doonga-net@greyrock.io"
  dns_entries = [
    # Cloudflare Email Routing
    {
      id       = "cloudflare_mx_1"
      name     = "@"
      priority = 62
      value    = "isaac.mx.cloudflare.net"
      type     = "MX"
    },
    {
      id       = "cloudflare_mx_2"
      name     = "@"
      priority = 51
      value    = "linda.mx.cloudflare.net"
      type     = "MX"
    },
    {
      id       = "cloudflare_mx_3"
      name     = "@"
      priority = 8
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
      value = "v=DMARC1; p=reject; rua=mailto:156e44c43ae14c0c9f3897924253ed28@dmarc-reports.cloudflare.net;"
      type  = "TXT"
    }
  ]
}
