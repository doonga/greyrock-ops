provider "minio" {
  alias          = "nas"
  minio_server   = "s3.private.greyrock.io:9000"
  minio_user     = module.onepassword_item_minio.fields.root_user_key
  minio_password = module.onepassword_item_minio.fields.root_secret_key
}
