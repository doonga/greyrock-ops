provider "vyos" {
  alias = "vyos"

  endpoint = "https://gateway.private.greyrock.io:8443"
  api_key  = module.onepassword_item_vyos.fields.api_key
}

provider "remote" {
  alias = "vyos"

  max_sessions = 2

  conn {
    host             = "gateway.private.greyrock.io"
    port             = "22"
    user             = module.onepassword_item_vyos.fields.username
    private_key_path = pathexpand("~/.ssh/id_rsa")

    sudo = true
  }
}
