module "cf_domain_nocanseemymail" {
  source     = "./modules/cf_domain"
  domain     = "nocanseemymail.com"
  account_id = cloudflare_account.greyrock.id
  dns_entries = [
    # Fastmail settings
    {
      id       = "fastmail_mx_1"
      name     = "@"
      priority = 10
      value    = "in1-smtp.messagingengine.com"
      type     = "MX"
    },
    {
      id       = "fastmail_mx_2"
      name     = "@"
      priority = 20
      value    = "in2-smtp.messagingengine.com"
      type     = "MX"
    },
    {
      id      = "fastmail_dkim_1"
      name    = "fm1._domainkey"
      value   = "fm1.nocanseemymail.com.dkim.fmhosted.com"
      type    = "CNAME"
      proxied = false
    },
    {
      id      = "fastmail_dkim_2"
      name    = "fm2._domainkey"
      value   = "fm2.nocanseemymail.com.dkim.fmhosted.com"
      type    = "CNAME"
      proxied = false
    },
    {
      id      = "fastmail_dkim_3"
      name    = "fm3._domainkey"
      value   = "fm3.nocanseemymail.com.dkim.fmhosted.com"
      type    = "CNAME"
      proxied = false
    },
    {
      id    = "fastmail_spf"
      name  = "@"
      value = "v=spf1 include:spf.messagingengine.com ?all"
      type  = "TXT"
    },
  ]
}
