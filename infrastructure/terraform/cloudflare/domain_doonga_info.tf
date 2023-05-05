module "cf_domain_doonga_info" {
  source     = "./modules/cf_domain"
  domain     = "doonga.info"
  account_id = cloudflare_account.greyrock.id
  plan_type  = "free"
  email_catch_all = "tpunderson+doonga-info@greyrock.io"
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
      value = "v=spf1 include:_spf.mx.cloudflare.net ~all"
      type  = "TXT"
    },
  ]
}
