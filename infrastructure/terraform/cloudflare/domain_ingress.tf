module "cf_domain_ingress" {
  source     = "./modules/cf_domain"
  domain     = "greyrock.tech"
  account_id = cloudflare_account.greyrock.id
  plan_type  = "pro"
  enable_email_routing = true
  email_catch_all_address = "tpunderson+greyrock-tech@greyrock.io"
  dns_entries = [
  # Cloudflare Email Routing
    {
      id       = "cloudflare_mx_1"
      name     = "@"
      priority = 81
      value    = "route1.mx.cloudflare.net"
      type     = "MX"
    },
    {
      id       = "cloudflare_mx_2"
      name     = "@"
      priority = 53
      value    = "route2.mx.cloudflare.net"
      type     = "MX"
    },
    {
      id       = "cloudflare_mx_3"
      name     = "@"
      priority = 34
      value    = "route3.mx.cloudflare.net"
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
      value = "v=DMARC1; p=reject; sp=reject; adkim=s; aspf=s; rua=mailto:9ff38b3b2fea437ca0ec34207b72df2d@dmarc-reports.cloudflare.net;"
      type  = "TXT"
    },
    {
      id    = "cloudflare_dkim"
      name  = "*._domainkey"
      value = "v=DKIM1; p="
      type  = "TXT"
    },
    {
      id    = "azure_validator"
      name  = "@"
      value = "MS=ms17505606"
      type  = "TXT"
    },
  ]
}

# Allow Flux Webhook to access zone
resource "cloudflare_filter" "cf_domain_ingress_github_flux_webhook" {
  zone_id     = module.cf_domain_ingress.zone_id
  description = "Allow GitHub flux API"
  expression  = "(ip.geoip.asnum eq 36459 and http.host eq \"flux-receiver-greyrock-ops.greyrock.tech\")"
}

resource "cloudflare_firewall_rule" "cf_domain_ingress_github_flux_webhook" {
  zone_id     = module.cf_domain_ingress.zone_id
  description = "Allow GitHub flux API"
  filter_id   = cloudflare_filter.cf_domain_ingress_github_flux_webhook.id
  action      = "allow"
  priority    = 1
}

# Block Plex notifications (prevents cloudflared container spam)
resource "cloudflare_filter" "plex_notifications" {
  zone_id     = data.cloudflare_zone.zone_id
  description = "Expression to block Plex notifications"
  expression  = "(http.host eq \"plex.greyrock.tech\" and http.request.uri.path contains \"/:/eventsource/notifications\")"
}

resource "cloudflare_firewall_rule" "plex_notifications" {
  zone_id     = data.cloudflare_zone.zone_id
  description = "Firewall rule to block Plex notifications"
  filter_id   = cloudflare_filter.plex_notifications.id
  action      = "block"
}
