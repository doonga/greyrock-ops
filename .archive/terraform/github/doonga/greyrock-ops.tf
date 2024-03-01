module "greyrock_ops" {
  source = "github.com/bjw-s/terraform-github-repository?ref=v1.2.0"

  name         = "greyrock-ops"
  description  = "My home or for-home infrastructure written as code, adhering to GitOps practices"
  topics       = ["flux", "gitops", "iac", "k8s-at-home", "kubernetes", "renovate"]
  homepage_url = "https://greyrock.github.io/greyrock-ops"
  visibility   = "public"

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
    {},
    local.greyrock_bot_secrets
  )

  issue_labels_manage_default_github_labels = false
  issue_labels = concat(
    [
      { name = "area/ci", color = "72ccf3", description = "Issue relates to CI" },
      { name = "area/kubernetes", color = "72ccf3", description = "Issue relates to Kubernetes" },

      { name = "renovate/container", color = "ffc300", description = "Issue relates to a Renovate container update" },
      { name = "renovate/helm", color = "ffc300", description = "Issue relates to a Renovate helm update" },
    ],
    local.issue_labels_semver,
    local.issue_labels_size,
    local.issue_labels_category
  )

  pages = {
    custom_404 = true
    build_type = "legacy"
    branch     = "gh-pages"
    path       = "/"
  }

  webhooks = [
    {
      events = ["push"]
      url    = nonsensitive(var.secrets.flux_github_webhook_url)
      secret = var.secrets.flux_github_webhook_secret
    }
  ]
}
