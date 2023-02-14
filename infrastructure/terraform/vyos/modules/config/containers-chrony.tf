resource "vyos_config" "container-chrony" {
  path = "container name chrony"
  value = jsonencode({
    "image"               = "${var.config.containers.chrony.image}"
    "network" = {
      "services" = {
        "address" = "${cidrhost(var.networks.services, 5)}"
      }
    }
    "environment" = {
      "NTP_SERVERS" = {
        "value" = "${var.config.ntp_servers}"
      }
    }
  "restart" = "on-failure"
  })
}
