resource "auth0_role" "admins" {
  name        = "admins"
  description = "site admins"
}

resource "auth0_role" "calibre_web" {
  name        = "calibre-web"
  description = "calibre-web access"
}

resource "auth0_role" "grafana_admin" {
  name        = "grafana-admin"
  description = "Grafana admins"
}

resource "auth0_role" "paperless" {
  name        = "paperless"
  description = "Paperless access"
}

resource "auth0_role" "miniflux" {
  name        = "miniflux"
  description = "Miniflux access"
}

resource "auth0_role" "frigate" {
  name        = "frigate"
  description = "Frigate access"
}

resource "auth0_role" "todds_stuff" {
  name        = "todds-stuff"
  description = "Todd's Resources"
}

resource "auth0_role" "andys_stuff" {
  name        = "andys-stuff"
  description = "Andy's Resources"
}

resource "auth0_role" "teslamate" {
  name        = "teslamate"
  description = "Teslamate"
}
