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
      version = "5.42.0"
    }
  }
}

module "onepassword_item_github" {
  source = "github.com/bjw-s/terraform-1password-item?ref=main"
  vault  = "Services"
  item   = "Github"
}

module "onepassword_item_github_greyrock_bot" {
  source = "github.com/bjw-s/terraform-1password-item?ref=main"
  vault  = "Automation"
  item   = "github-greyrock-bot"
}

module "onepassword_item_flux" {
  source = "github.com/bjw-s/terraform-1password-item?ref=main"
  vault  = "Automation"
  item   = "flux"
}

module "onepassword_item_discord" {
  source = "github.com/bjw-s/terraform-1password-item?ref=main"
  vault  = "Services"
  item   = "Discord"
}

module "doonga" {
  source = "./doonga"

  defaults = {
    auto_init              = true
    allow_merge_commit     = false
    allow_squash_merge     = true
    allow_auto_merge       = true
    delete_branch_on_merge = true

    squash_merge_commit_message = "BLANK"

    has_issues   = true
    has_wiki     = false
    has_projects = false
  }

  secrets = {
    greyrock_bot_app_id        = module.onepassword_item_github_greyrock_bot.fields.github_app_id
    greyrock_bot_private_key   = module.onepassword_item_github_greyrock_bot.fields.github_app_private_key
    flux_github_webhook_url    = module.onepassword_item_flux.fields.github_webhook_url
    flux_github_webhook_secret = module.onepassword_item_flux.fields.github_webhook_token
    discord_ci_webhook_url     = module.onepassword_item_discord.fields.webhook_greyrock_github_ci
  }
}
