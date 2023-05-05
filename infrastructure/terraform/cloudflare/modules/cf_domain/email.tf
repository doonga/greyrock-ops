resource "cloudflare_email_routing_catch_all" "email_routing" {
  count = var.enable_email_routing ? 1 : 0
  zone_id = cloudflare_zone.zone.id
  name    = "catch all"
  enabled = var.enable_email_routing

  matcher {
    type = "all"
  }

  action {
    type  = "forward"
    value = [var.email_catch_all_address]
  }
}
