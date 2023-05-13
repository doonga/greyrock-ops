module "cf_domain_nocanseemymail" {
  source     = "./modules/cf_domain"
  domain     = "nocanseemymail.com"
  account_id = cloudflare_account.greyrock.id
  plan_type  = "free"
  enable_email_routing = false
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
      id    = "fastmail_dkim_1"
      name  = "fm1._domainkey"
      value = "fm1.nocanseemymail.com.dkim.fmhosted.com"
      type  = "TXT"
    },
    {
      id    = "fastmail_dkim_2"
      name  = "fm2._domainkey"
      value = "fm2.nocanseemymail.com.dkim.fmhosted.com"
      type  = "TXT"
    },
    {
      id    = "fastmail_dkim_3"
      name  = "fm3._domainkey"
      value = "fm3.nocanseemymail.com.dkim.fmhosted.com"
      type  = "TXT"
    },
    {
      id    = "fastmail_spf"
      name  = "@"
      value = "v=spf1 include:spf.messagingengine.com -all"
      type  = "TXT"
    },
    {
      id    = "cloudflare_dmarc"
      name  = "_dmarc"
      value = "v=DMARC1; p=reject; sp=reject; adkim=s; aspf=s; mailto:3bf00355c71d41bba80402d2dd6feacb@dmarc-reports.cloudflare.net;"
      type  = "TXT"
    },
  ]
}
