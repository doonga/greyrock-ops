resource "vyos_config" "container-udp-broadcast-relay-mdns" {
  path = "container name udp-broadcast-relay-mdns"
  value = jsonencode({
    "cap-add"             = "net-raw"
    "image"               = "${var.config.containers.udp-broadcast-relay.image}"
    "allow-host-networks" = {}
    "environment" = {
      "CFG_ID"        = { "value" = "2" }
      "CFG_PORT"      = { "value" = "5353" }
      "CFG_DEV"       = { "value" = "${var.config.zones.trusted.interface};${var.config.zones.iot.interface};${var.config.zones.servers.interface}" }
      "CFG_MULTICAST" = { "value" = "224.0.0.251" }
      "SEPARATOR"     = { "value" = ";" }
    }
  })
}
