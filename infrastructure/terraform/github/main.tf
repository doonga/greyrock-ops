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
      version = "5.41.0"
    }
  }
}

data "vault_generic_secret" "github" {
  path  = "secrets/github"
}

data "vault_generic_secret" "github_greyrock_bot" {
  path  = "secrets/github-greyrock-bot"
}

data "vault_generic_secret" "flux" {
  path  = "secrets/flux"
}

data "vault_generic_secret" "discord" {
  path  = "secrets/discord"
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
    greyrock_bot_app_id            = data.vault_generic_secret.github_greyrock_bot.data["github_app_id"]
    greyrock_bot_private_key       = data.vault_generic_secret.github_greyrock_bot.data["github_app_private_key"]
    flux_github_webhook_url        = data.vault_generic_secret.flux.data["github_webhook_url"]
    flux_github_webhook_secret     = data.vault_generic_secret.flux.data["github_webhook_token"]
    discord_ci_webhook_url         = data.vault_generic_secret.discord.data["webhook_greyrock_github_ci"]
  }
}
