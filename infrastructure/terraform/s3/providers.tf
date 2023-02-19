provider "garage" {
  alias  = "nas"
  host   = "nas.private.greyrock.io:3911"
  scheme = "http"
  token  = module.onepassword_item_garage.fields.admin_api_token
}
