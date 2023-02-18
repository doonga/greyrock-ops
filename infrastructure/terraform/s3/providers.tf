provider "minio" {
  alias          = "nas"
  minio_server   = "s3.private.greyrock.io:9000"
  minio_user     = module.onepassword_item_minio.fields.root_user_key
  minio_password = module.onepassword_item_minio.fields.root_secret_key
}

provider "garage" {
  alias  = "nas"
  host   = "nas.private.greyrock.io:3911"
  scheme = "http"
  token  = module.onepassword_item_garage.fields.admin_api_token
}
