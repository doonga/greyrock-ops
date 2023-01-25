module "cf_domain_main" {
  source     = "./modules/cf_domain"
  domain     = "greyrock.io"
  account_id = cloudflare_account.greyrock.id
  dns_entries = [
    {
      name    = "ipv4"
      value   = local.home_ipv4
      proxied = false
    },
    # To be cleaned up
    {
      id      = "enterpriseenrollment"
      name    = "enterpriseenrollment"
      value   = "enterpriseenrollment-s.manage.microsoft.com"
      type    = "CNAME"
      proxied = false
    },
    {
      id      = "enterpriseregistration"
      name    = "enterpriseregistration"
      value   = "enterpriseregistration.windows.net"
      type    = "CNAME"
      proxied = false
    },
    # Generic settings
    {
      name  = "_dmarc"
      value = "v=DMARC1; p=reject; rua=mailto:3iucjkde@ag.dmarcian.com; ruf=mailto:3iucjkde@fr.dmarcian.com;"
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
      priority = 20
      value    = "in2-smtp.messagingengine.com"
      type     = "MX"
    },
    {
      id      = "fastmail_dkim_1"
      name    = "fm1._domainkey"
      value   = "fm1.greyrock.io.dkim.fmhosted.com"
      type    = "CNAME"
      proxied = false
    },
    {
      id      = "fastmail_dkim_2"
      name    = "fm2._domainkey"
      value   = "fm2.greyrock.io.dkim.fmhosted.com"
      type    = "CNAME"
      proxied = false
    },
    {
      id      = "fastmail_dkim_3"
      name    = "fm3._domainkey"
      value   = "fm3.greyrock.io.dkim.fmhosted.com"
      type    = "CNAME"
      proxied = false
    },
    {
      id    = "fastmail_spf"
      name  = "@"
      value = "v=spf1 include:spf.messagingengine.com ?all"
      type  = "TXT"
    },
    # SL settings
    {
      id       = "fastmail_sl_mx_1"
      name     = "sl"
      priority = 10
      value    = "in1-smtp.messagingengine.com"
      type     = "MX"
    },
    {
      id       = "fastmail_sl_mx_2"
      name     = "sl"
      priority = 20
      value    = "in2-smtp.messagingengine.com"
      type     = "MX"
    },
    {
      id      = "fastmail_sl_dkim_1"
      name    = "fm1._domainkey.sl"
      value   = "fm1.sl.greyrock.io.dkim.fmhosted.com"
      type    = "CNAME"
      proxied = false
    },
    {
      id      = "fastmail_sl_dkim_2"
      name    = "fm2._domainkey.sl"
      value   = "fm2.sl.greyrock.io.dkim.fmhosted.com"
      type    = "CNAME"
      proxied = false
    },
    {
      id      = "fastmail_sl_dkim_3"
      name    = "fm3._domainkey.sl"
      value   = "fm3.sl.greyrock.io.dkim.fmhosted.com"
      type    = "CNAME"
      proxied = false
    },
    {
      id    = "fastmail_sl_spf"
      name  = "sl"
      value = "v=spf1 include:spf.messagingengine.com ?all"
      type  = "TXT"
    },
    # Mailgun settings
    {
      id       = "mailgun_mx_1"
      name     = "m"
      priority = 10
      value    = "mxa.mailgun.org"
      type     = "MX"
    },
    {
      id       = "mailgun_mx_2"
      name     = "m"
      priority = 10
      value    = "mxb.mailgun.org"
      type     = "MX"
    },
    {
      id    = "mailgun_dkim_1"
      name  = "k1._domainkey.m"
      value = "k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDkdgIg6tzM3vR2fZcv2Dt5alk2CXokEjEl4611Bl/mSfUzy1H8MchnIOTVGvCgGVyyDFxxvsV+y7znBmK1S4vFaO8aCWlXpei5MGU+SK3VqFtGsQaPnQvE2BPNql7KlJ2FtKq3KB2Hs4Y9D5/GQCvlru9iTR3fTO4/iNCd06Ey8wIDAQAB"
      type  = "TXT"
    },
    {
      id    = "mailgun_spf"
      name  = "m"
      value = "v=spf1 include:mailgun.org ~all"
      type  = "TXT"
    },
    {
      id      = "mailgun_email"
      name    = "email.m"
      value   = "mailgun.org"
      type    = "CNAME"
      proxied = false
    },
    # Fly.io settings
    {
      id      = "fly_status_challenge"
      name    = "_acme-challenge.status"
      value   = "status.greyrock.io.gk291w.flydns.net."
      type    = "CNAME"
      proxied = false
    },
    {
      id      = "fly_status_app"
      name    = "status"
      value   = "greyrock-gatus.fly.dev"
      type    = "CNAME"
      proxied = true
    },
  ]
}
