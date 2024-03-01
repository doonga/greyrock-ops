module "cf_domain_undercovermail" {
  source               = "./modules/cf_domain"
  domain               = "undercovermail.org"
  account_id           = cloudflare_account.greyrock.id
  plan_type            = "free" # change to free when plan expires
  enable_email_routing = false

  dns_entries = [
    # Generic settings
    {
      name  = "_dmarc"
      value = "v=DMARC1; p=reject; sp=reject; adkim=s; aspf=s; rua=mailto:ddfbe302fb6e4fe1a81d1e47c52ffad2@dmarc-reports.cloudflare.net"
      type  = "TXT"
    },
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
      priority = 10
      value    = "in2-smtp.messagingengine.com"
      type     = "MX"
    },
    {
      id      = "fastmail_dkim_1"
      name    = "fm1._domainkey"
      value   = "fm1.undercovermail.org.dkim.fmhosted.com"
      type    = "CNAME"
      proxied = false
    },
    {
      id      = "fastmail_dkim_2"
      name    = "fm2._domainkey"
      value   = "fm2.undercovermail.org.dkim.fmhosted.com"
      type    = "CNAME"
      proxied = false
    },
    {
      id      = "fastmail_dkim_3"
      name    = "fm3._domainkey"
      value   = "fm3.undercovermail.org.dkim.fmhosted.com"
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
