provider "minio" {
  alias  = "nas"
  minio_server   = "s3.greyrock.io:9000"
  minio_user     = module.onepassword_item_minio.fields.root_username
  minio_password = module.onepassword_item_minio.fields.root_password
}
