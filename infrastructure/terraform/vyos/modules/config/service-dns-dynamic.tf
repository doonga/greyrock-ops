resource "vyos_config" "service-dns-dynamic-ingress" {
  path = "service dns dynamic interface eth0 service ingress"
  value = jsonencode(
    {
      "host-name" = "ipv4.greyrock.tech"
      "server"    = "api.cloudflare.com/client/v4"
      "protocol"  = "cloudflare"
      "zone"      = "greyrock.tech"
      "login"     = "${var.secrets.cloudflare.login}"
      "password"  = "${var.secrets.cloudflare.key}"
    }
  )
}

resource "vyos_config" "service-dns-dynamic-hardware" {
  path = "service dns dynamic interface eth0 service hardware"
  value = jsonencode(
    {
      "host-name" = "ipv4.greyrock.io"
      "server"    = "api.cloudflare.com/client/v4"
      "protocol"  = "cloudflare"
      "zone"      = "greyrock.io"
      "login"     = "${var.secrets.cloudflare.login}"
      "password"  = "${var.secrets.cloudflare.key}"
    }
  )
}
