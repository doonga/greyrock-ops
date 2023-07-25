provider "kubernetes" {
  host                   = "https://harbor.greyrock.io:6443"
  client_certificate     = base64decode(module.onepassword_item_harbor.fields.client_certificate)
  client_key             = base64decode(module.onepassword_item_harbor.fields.client_key)
  cluster_ca_certificate = base64decode(module.onepassword_item_harbor.fields.cluster_ca_certificate)
}

provider "helm" {
  kubernetes {
    host                   = "https://harbor.greyrock.io:6443"
    client_certificate     = base64decode(module.onepassword_item_harbor.fields.client_certificate)
    client_key             = base64decode(module.onepassword_item_harbor.fields.client_key)
    cluster_ca_certificate = base64decode(module.onepassword_item_harbor.fields.cluster_ca_certificate)
  }
}
