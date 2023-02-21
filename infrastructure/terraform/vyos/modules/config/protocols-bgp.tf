resource "vyos_config" "protocols-bgp" {
  path = "protocols bgp"
  value = jsonencode(
    {
      # main setup
      system-as = "64512"
      parameters = {
        router-id = "10.1.0.1"
      }

      # Neighbors
      neighbor = {
        # Kubernetes nodes
        cidrhost(var.networks[var.address_book.hosts.k8s1.network], var.address_book.hosts.k8s1.ipv4_hostid) = {
          address-family = {
            ipv4-unicast = {}
          }
          description = "k8s1"
          remote-as   = "64513"
        }

        cidrhost(var.networks[var.address_book.hosts.k8s2.network], var.address_book.hosts.k8s2.ipv4_hostid) = {
          address-family = {
            ipv4-unicast = {}
          }
          description = "k8s2"
          remote-as   = "64513"
        }

        cidrhost(var.networks[var.address_book.hosts.k8s3.network], var.address_book.hosts.k8s3.ipv4_hostid) = {
          address-family = {
            ipv4-unicast = {}
          }
          description = "k8s3"
          remote-as   = "64513"
        }

        cidrhost(var.networks[var.address_book.hosts.k8s4.network], var.address_book.hosts.k8s4.ipv4_hostid) = {
          address-family = {
            ipv4-unicast = {}
          }
          description = "k8s4"
          remote-as   = "64513"
        }

        cidrhost(var.networks[var.address_book.hosts.k8s5.network], var.address_book.hosts.k8s5.ipv4_hostid) = {
          address-family = {
            ipv4-unicast = {}
          }
          description = "k8s5"
          remote-as   = "64513"
        }

        cidrhost(var.networks[var.address_book.hosts.k8s6.network], var.address_book.hosts.k8s6.ipv4_hostid) = {
          address-family = {
            ipv4-unicast = {}
          }
          description = "k8s6"
          remote-as   = "64513"
        }

      }
    }
  )
}
