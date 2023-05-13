resource "auth0_custom_domain" "auth0_greyrock_io" {
  domain = "auth0.greyrock.io"
  type   = "auth0_managed_certs"
}

resource "auth0_custom_domain_verification" "auth0_domain_verification" {
  depends_on = [cloudflare_record.auth0_domain_name_record]

  custom_domain_id = auth0_custom_domain.auth0_greyrock_io.id

  timeouts { create = "15m" }
}

resource "cloudflare_record" "auth0_domain_name_record" {
  zone_id = "36af45cd5631074cdc5c9440e81de412"
  name    = "${auth0_custom_domain.auth0_greyrock_io.domain}"
  value   = "${auth0_custom_domain.auth0_greyrock_io.verification[0].methods[0].record}"
  type    = "CNAME"
  ttl     = 3600
}
