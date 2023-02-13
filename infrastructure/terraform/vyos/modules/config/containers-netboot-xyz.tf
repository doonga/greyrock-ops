resource "vyos_config" "container-netboot-xyz" {
  path = "container name netboot-xyz"
  value = jsonencode({
    "cap-add" = "net-bind-service"
    "image"   = "${var.config.containers.netboot-xyz.image}"
    "network" = {
      "services" = {
        "address" = "${cidrhost(var.networks.services, 254)}"
      }
    }
    "volume" = {
      "config" = {
        "source"      = "/config/netboot-xyz/config"
        "destination" = "/config"
      },
      "assets" = {
        "source"      = "/config/netboot-xyz/assets"
        "destination" = "/assets"
      }
    }
  })

  depends_on = [
    vyos_config.container_network-services
  ]
}
