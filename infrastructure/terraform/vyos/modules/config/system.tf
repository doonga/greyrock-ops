resource "vyos_config" "system-hostname" {
  path = "system host-name"
  value = jsonencode("gateway")
}

resource "vyos_config" "system-domain_name" {
  path = "system domain-name"
  value = jsonencode("private.greyrock.io")
}

resource "vyos_config" "system-name_server" {
  path = "system name-server"
  value = jsonencode("1.1.1.1")
}

resource "vyos_config" "system-time_zone" {
  path = "system time-zone"
  value = jsonencode("America/New_York")
}

resource "vyos_config" "system-task_scheduler" {
  path = "system task-scheduler"
  value = jsonencode({
    "task" = {
      "backup-config" = {
        "crontab-spec" = "30 0 * * *"
        "executable" = {
          "path" = "/config/scripts/custom-config-backup.sh"
        }
      }
    }
  })
}

resource "vyos_config" "system-login-user" {
  path = "system login user"
  value = jsonencode({
    vyos = {
      authentication = {
        encrypted-password = "${var.secrets.vyos_password}"
        # plaintext-password = ""

        public-keys = {
          personal = {
            key  = "AAAAB3NzaC1yc2EAAAADAQABAAACAQDHh+0z1ZlAubCwbz73a4dD2jUvtIKTBF4j8VuiNYhfk9+pfJmb+Qrgl4OnWsKhHSpB+5r3w7DOM0cj/E1uB2O0ScVBZ/a6A2XcOvc9eD0PDXYtgdNnD+T4WbWlUs6UrOTlvlMlXB6hOducuVh60DDcH8E8i1vSTWIWvSG0/1evpkgVxmFjtuLel1a/nWoKLl+4a0VwDrWm2msxlEBVAY7O5vIbcj8UWsAU02+xGXMZcem24f5b+/g1OssyelxuLvZ5+oVfqixWpM1drMXTv1b319WJ2ZJKsokFcr4CciaIGOXznV+k5d1wVgiSlJ8LE3aPCnYVj8LWSwK4mowrWpo0evlb1TqUZE3cA4UY2LMFvlgsZL4S9NsuMasKQH+0Bu8yIQKACLPdUwIrRC63RFNIZqlwqVYkgW+KqUtY4REwTVjHtoMldBMfU3G3PT17Ha+Om2il6BHAPRar2VQmyzIEm/7YEofVIY8fbJjUeigP2k1/5Yx7vJ77OEFzp1rKMEEvUeSd7gaPdzTOVhUwAdOyaSMkpHUS9B2vzCgcteOJZCHjmgz7EdO+2uf2Cts0mhAhX5Flmg6ojx6DXmabdrUUeTJTnUcO0iTziOmsMXpYIclXoysWfPx68GxZ/v/6ojok+wtIOV+Dmtg4+LoaqUuoIRQTSXYw1fJdxuAya3Jf5Q=="
            type = "ssh-rsa"
          }

        }
      }
    }
  })
}
