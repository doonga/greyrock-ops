module "cf_domain_main" {
  source     = "./modules/cf_domain"
  domain     = "greyrock.io"
  account_id = cloudflare_account.greyrock.id
  plan_type  = "pro" # change to free when plan expires
  enable_email_routing = false

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
    # Generic settings
    {
      name  = "_dmarc"
      value = "v=DMARC1; p=reject; sp=reject; adkim=s; aspf=s; rua=mailto:9fad2d90843e43ff94930d1289f5dead@dmarc-reports.cloudflare.net"
      type  = "TXT"
    },
    # iCloud settings
    {
      id       = "icloud_mx_1"
      name     = "@"
      priority = 10
      value    = "mx01.mail.icloud.com."
      type     = "MX"
    },
    {
      id       = "icloud_mx_2"
      name     = "@"
      priority = 20
      value    = "mx02.mail.icloud.com."
      type     = "MX"
    },
    {
      id      = "icloud_dkim_1"
      name    = "sig1._domainkey"
      value   = "sig1.dkim.greyrock.io.at.icloudmailadmin.com."
      type    = "CNAME"
      proxied = false
    },
    {
      id    = "icloud_spf"
      name  = "@"
      value = "v=spf1 include:icloud.com ~all"
      type  = "TXT"
    },
    {
      id    = "icloud_validator"
      name  = "@"
      value = "apple-domain=q5Igx7wZUIwIR7xW"
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
      value = "v=spf1 include:mailgun.org -all"
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

  waf_custom_rules = [
    {
      enabled     = true
      description = "Firewall rule to block bots and threats determined by CF"
      expression  = "(cf.client.bot) or (cf.threat_score gt 14)"
      action      = "block"
    },
    {
      enabled     = true
      description = "Firewall rule to block all countries except US"
      expression  = "(ip.geoip.country ne \"US\")"
      action      = "block"
    },
  ]
}
