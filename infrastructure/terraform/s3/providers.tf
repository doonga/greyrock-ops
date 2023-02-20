provider "garage" {
  alias  = "nas"
  host   = "s3.private.greyrock.io:3911"
  scheme = "http"
  token  = module.onepassword_item_garage.fields.admin_api_token
}
