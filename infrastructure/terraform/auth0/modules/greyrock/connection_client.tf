resource "auth0_connection_client" "username_password_authentication_default" {
  connection_id = auth0_connection.username_password_authentication.id
  client_id     = auth0_client.default.id
}

resource "auth0_connection_client" "username_password_authentication_miniflux" {
  connection_id = auth0_connection.username_password_authentication.id
  client_id     = auth0_client.miniflux.id
}

resource "auth0_connection_client" "google_oauth2_connection_default" {
  connection_id = auth0_connection.google_oauth2_connection.id
  client_id     = auth0_client.default.id
}
