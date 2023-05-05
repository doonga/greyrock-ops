resource "cloudflare_email_routing_catch_all" "email_routing" {
  zone_id = cloudflare_zone.zone.id
  name    = "catch all"
  enabled = true

  matcher {
    type = "all"
  }

  action {
    type  = "forward"
    value = [var.email_catch_all]
  }
}
