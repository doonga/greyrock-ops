terraform {
  cloud {
    hostname     = "app.terraform.io"
    organization = "grey-rock"
    workspaces {
      name = "grey-rock-storage"
    }
  }
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.22.0"
    }
    time = {
      source  = "hashicorp/time"
      version = "0.9.1"
    }
  }
  required_version = ">= 1.3.0"
}

module "onepassword_item_storage" {
  source = "github.com/Doonga/terraform-1password-item?ref=main"
  vault  = "Automation"
  item   = "Storage"
}
