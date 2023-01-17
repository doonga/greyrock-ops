resource "fly_cert" "cert" {
  app      = fly_app.app.name
  hostname = "status.greyrock.io"
}
