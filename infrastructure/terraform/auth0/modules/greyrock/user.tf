resource "auth0_user" "todd" {
  connection_name = auth0_connection.username_password_authentication.name

  name     = var.secrets["users"]["todd"]["email"]
  nickname = "todd"
  email    = var.secrets["users"]["todd"]["email"]
  password = var.secrets["users"]["todd"]["password"]

  roles = [
    auth0_role.admins.id,
    auth0_role.k8s_admin.id,
    auth0_role.grafana_admin.id,
    auth0_role.calibre_web.id,
    auth0_role.paperless.id,
    auth0_role.miniflux.id,
    auth0_role.frigate.id,
  ]

  blocked        = false
  email_verified = true
  picture        = "https://s.gravatar.com/avatar/69608df86b795d8d1eca3dc0f641ce14?s=480&r=pg&d=https%3A%2F%2Fcdn.auth0.com%2Favatars%2Ftp.png"
}

resource "auth0_user" "andy" {
  connection_name = auth0_connection.username_password_authentication.name

  name     = var.secrets["users"]["andy"]["email"]
  nickname = "andy"
  email    = var.secrets["users"]["andy"]["email"]
  password = var.secrets["users"]["andy"]["password"]

  roles = [
    auth0_role.calibre_web.id,
    auth0_role.paperless.id,
    auth0_role.frigate.id,
  ]

  blocked        = false
  email_verified = true
  picture        = "https://s.gravatar.com/avatar/0e840c4607e58c510774bcf301b5b534?s=480&r=pg&d=https%3A%2F%2Fcdn.auth0.com%2Favatars%2Fmf.png"
}
