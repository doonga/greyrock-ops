module "container_images" {
  source = "github.com/bjw-s/terraform-github-repository?ref=v1.2.0"

  name        = "container-images"
  description = "Kubernetes tailored container images for various applications"
  topics      = ["kubernetes", "docker", "containers"]
  visibility  = "public"

  auto_init              = var.defaults.auto_init
  allow_merge_commit     = var.defaults.allow_merge_commit
  allow_squash_merge     = var.defaults.allow_squash_merge
  allow_auto_merge       = var.defaults.allow_auto_merge
  delete_branch_on_merge = var.defaults.delete_branch_on_merge

  squash_merge_commit_message = var.defaults.squash_merge_commit_message

  has_issues   = var.defaults.has_issues
  has_wiki     = var.defaults.has_wiki
  has_projects = var.defaults.has_projects

  plaintext_secrets = merge(
    {
      "GREYROCK_DISCORD_WEBHOOK" : var.secrets.discord_ci_webhook_url
    },
    local.greyrock_bot_secrets
  )

  issue_labels_manage_default_github_labels = false
  issue_labels = concat(
    [],
    local.issue_labels_semver,
    local.issue_labels_category
  )
}
