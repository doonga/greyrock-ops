module "cf_domain_nocanseemymail" {
  source     = "./modules/cf_domain"
  domain     = "nocanseemymail.com"
  account_id = cloudflare_account.greyrock.id
  plan_type  = "free"
  email_catch_all = "tpunderson+nocanseemymail@greyrock.io"
  dns_entries = [
    # Cloudflare Email Routing
    {
      id       = "cloudflare_mx_1"
      name     = "@"
      priority = 22
      value    = "route1.mx.cloudflare.net"
      type     = "MX"
    },
    {
      id       = "cloudflare_mx_2"
      name     = "@"
      priority = 91
      value    = "route2.mx.cloudflare.net"
      type     = "MX"
    },
    {
      id       = "cloudflare_mx_3"
      name     = "@"
      priority = 6
      value    = "route3.mx.cloudflare.net"
      type     = "MX"
    },
    {
      id    = "cloudflare_spf"
      name  = "@"
      value = "v=spf1 include:_spf.mx.cloudflare.net ~all"
      type  = "TXT"
    },
  ]
}
