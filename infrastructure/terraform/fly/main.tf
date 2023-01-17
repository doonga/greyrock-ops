terraform {
  cloud {
    organization = "grey-rock"
    workspaces {
      name = "greyrock-ops-fly-provisioner"
    }
  }

  required_providers {
    fly = {
      source  = "fly-apps/fly"
      version = "0.0.20"
    }
    http = {
      source  = "hashicorp/http"
      version = "3.2.1"
    }
  }
}

module "onepassword_item_fly" {
  source = "github.com/doonga/terraform-1password-item?ref=main"
  vault  = "Services"
  item   = "Fly"
}

module "onepassword_item_pushover" {
  source = "github.com/doonga/terraform-1password-item?ref=main"
  vault  = "Services"
  item   = "Pushover"
}

module "onepassword_item_auth0" {
  source = "github.com/doonga/terraform-1password-item?ref=main"
  vault  = "Automation"
  item   = "auth0"
}

provider "fly" {
  fly_api_token        = module.onepassword_item_fly.fields.access_token_terraform
  useinternaltunnel    = true
  internaltunnelorg    = "personal"
  internaltunnelregion = "iad"
}

module "gatus" {
  source = "./modules/gatus"

  secrets = {
    gatus = {
      oidc = {
        issuer_url    = "${module.onepassword_item_auth0.fields.greyrock_custom_domain}/"
        client_id     = module.onepassword_item_auth0.fields.generic_client_id
        client_secret = module.onepassword_item_auth0.fields.generic_client_secret
        subjects      = ["auth0|63bf4b931234b841d085c087"]
      },
      pushover = {
        token    = module.onepassword_item_pushover.fields.gatus_token
        user_key = module.onepassword_item_pushover.fields.userkey_todd
      }
    }
  }
  regions = ["iad"]
}
