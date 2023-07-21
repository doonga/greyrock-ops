resource "auth0_connection_client" "passwordless_email_default" {
  connection_id = auth0_connection.passwordless_email.id
  client_id     = auth0_client.default.id
}

resource "auth0_connection_client" "passwordless_email_miniflux" {
  connection_id = auth0_connection.passwordless_email.id
  client_id     = auth0_client.miniflux.id
}
