locals {
  minio_buckets = [
    "loki",
    "thanos",
    "volsync",
    "crunchy-postgres",
    "tagspaces",
    "zipline"
  ]
}

module "minio_bucket" {
  for_each         = toset(local.minio_buckets)
  source           = "./modules/minio_bucket"
  bucket_name      = each.key
  is_public        = false
  owner_access_key = lookup(data.vault_generic_secret.minio.data, "${each.key}_access_key", null)
  owner_secret_key = lookup(data.vault_generic_secret.minio.data, "${each.key}_secret_key", null)
  providers = {
    minio = minio.nas
  }
}
output "minio_bucket_outputs" {
  value     = module.minio_bucket
  sensitive = true
}
