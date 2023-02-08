resource "vyos_config" "qos-policy" {
  path = "qos policy"
  value = jsonencode({
    "shaper" = {
      "shape-35mbit" = {
        "description"        = "35mb/s with FQ_CODEL WAN OUT"
        "bandwidth"          = "35mbit"
        "default" = {
          "bandwidth"   = "90%"
          "ceiling"     = "100%"
          "queue-type"  = "fq-codel"
        }
      }
    }
    "limiter" = {
      "shape-700mbit" = {
        "description"        = "700mb/s WAN IN"
        "default" = {
          "bandwidth"   = "700mbit"
        }
      }
    }
  })
}

resource "vyos_config" "qos-interface" {
  path = "qos interface"
  value = jsonencode({
    "eth4" = {
      "egress"  = "shape-35mbit"
      "ingress" = "shape-700mbit"
    }
  })
  depends_on = [
    vyos_config.interface-wan
  ]
}
