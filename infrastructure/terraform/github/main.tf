terraform {
  cloud {
    organization = "grey-rock"
    workspaces {
      name = "greyrock-github-provisioner"
    }
  }

  required_providers {
    github = {
      source  = "integrations/github"
      version = "5.15.0"
    }
  }
}

module "onepassword_item_github" {
  source = "github.com/Doonga/terraform-1password-item?ref=main"
  vault  = "Services"
  item   = "Github"
}

module "onepassword_item_github_greyrock_bot" {
  source = "github.com/Doonga/terraform-1password-item?ref=main"
  vault  = "Automation"
  item   = "github-greyrock-bot"
}

module "onepassword_item_flux" {
  source = "github.com/Doonga/terraform-1password-item?ref=main"
  vault  = "Automation"
  item   = "flux"
}
