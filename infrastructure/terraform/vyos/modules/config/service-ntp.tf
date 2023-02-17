resource "vyos_config" "service-ntp" {
  path = "service ntp"
  value = jsonencode({
    "server" = {
      "chronos.private.greyrock.io" = {}
      "0.us.pool.ntp.org" = {}
      "1.us.pool.ntp.org" = {}
      "2.us.pool.ntp.org" = {}
      "3.us.pool.ntp.org" = {}
      "4.us.pool.ntp.org" = {}
    }
    "allow-client" = {
      "address" = [
        "${var.networks.lan}",
        "${var.networks.servers}",
        "${var.networks.trusted}",
        "${var.networks.iot}",
        "${var.networks.video}",
        "${var.networks.wg_trusted}"
      ]
    }
  })
}
