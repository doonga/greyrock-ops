resource "auth0_user" "todd" {
  connection_name = auth0_connection.passwordless_email.name

  name     = var.secrets["users"]["todd"]["email"]
  nickname = "todd"
  email    = var.secrets["users"]["todd"]["email"]

  # Until we remove the ability to operate changes on
  # the roles field it is important to have this
  # block in the config, to avoid diffing issues.
  lifecycle {
    ignore_changes = [roles]
  }

  blocked        = false
  email_verified = true
  picture        = "https://s.gravatar.com/avatar/69608df86b795d8d1eca3dc0f641ce14?s=480&r=pg&d=https%3A%2F%2Fcdn.auth0.com%2Favatars%2Ftp.png"
}

resource "auth0_user_roles" "todd_user_roles" {
  user_id = auth0_user.todd.id
  roles   = [ auth0_role.admins.id,
              auth0_role.todds_stuff.id,
              auth0_role.grafana_admin.id,
              auth0_role.calibre_web.id,
              auth0_role.paperless.id,
              auth0_role.miniflux.id,
              auth0_role.frigate.id,
              auth0_role.teslamate.id,
  ]
}

resource "auth0_user" "andy" {
  connection_name = auth0_connection.passwordless_email.name

  name     = var.secrets["users"]["andy"]["email"]
  nickname = "andy"
  email    = var.secrets["users"]["andy"]["email"]

  # Until we remove the ability to operate changes on
  # the roles field it is important to have this
  # block in the config, to avoid diffing issues.
  lifecycle {
    ignore_changes = [roles]
  }

  blocked        = false
  email_verified = true
  picture        = "https://s.gravatar.com/avatar/0e840c4607e58c510774bcf301b5b534?s=480&r=pg&d=https%3A%2F%2Fcdn.auth0.com%2Favatars%2Fmf.png"
}

resource "auth0_user_roles" "andy_user_roles" {
  user_id = auth0_user.andy.id
  roles   = [ auth0_role.andys_stuff.id,
              auth0_role.calibre_web.id,
              auth0_role.paperless.id,
              auth0_role.frigate.id,
  ]
}
