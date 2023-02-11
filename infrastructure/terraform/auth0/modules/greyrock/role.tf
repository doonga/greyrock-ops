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

resource "auth0_role" "k8s_admin" {
  name        = "k8s-admin"
  description = "Kubernetes cluster admins"
}

resource "auth0_role" "paperless" {
  name        = "paperless"
  description = "Paperless access"
}

resource "auth0_role" "miniflux" {
  name        = "miniflux"
  description = "Miniflux access"
}

resource "auth0_role" "whoogle" {
  name        = "whoogle"
  description = "Whoogle access"
}

resource "auth0_role" "nitter" {
  name        = "nitter"
  description = "Nitter access"
}

resource "auth0_role" "libreddit" {
  name        = "libreddit"
  description = "libreddit access"
}
