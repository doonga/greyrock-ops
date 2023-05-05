module "cf_domain_main" {
  source     = "./modules/cf_domain"
  domain     = "greyrock.io"
  account_id = cloudflare_account.greyrock.id
  plan_type  = "pro" # change to free when plan expires
  email_catch_all = "tpunderson@greyrock.io"
  dns_entries = [
    {
      name    = "ipv4"
      value   = local.home_ipv4
    },
    {
      name    = "vpn"
      value   = "ipv4.greyrock.io"
      type    = "CNAME"
      proxied = false
    },
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
    {
      id       = "o365_mx_1"
      name     = "@"
      priority = 0
      value    = "greyrock-io.mail.protection.outlook.com"
      type     = "MX"
    },
    {
      id      = "o365_dkim_1"
      name    = "selector1._domainkey"
      value   = "selector1-greyrock-io._domainkey.azureslgreyrock.onmicrosoft.com"
      type    = "CNAME"
      proxied = false
    },
    {
      id      = "o365_dkim_2"
      name    = "selector2._domainkey"
      value   = "selector2-greyrock-io._domainkey.azureslgreyrock.onmicrosoft.com"
      type    = "CNAME"
      proxied = false
    },
    {
      id    = "o365_spf"
      name  = "@"
      value = "v=spf1 include:spf.protection.outlook.com -all"
      type  = "TXT"
    },
    {
      id      = "o365_autodiscover"
      name    = "autodiscover"
      value   = "autodiscover.outlook.com"
      type    = "CNAME"
      proxied = false
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
  ]
}
