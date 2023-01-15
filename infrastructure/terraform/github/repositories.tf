module "greyrock-ops" {
  source = "github.com/doonga/terraform-github-repository.git?ref=main"

  name         = "greyrock-ops"
  description  = "My home or for-home infrastructure written as code, adhering to GitOps practices"
  topics       = ["flux", "gitops", "iac", "k8s-at-home", "kubernetes", "renovate"]
  homepage_url = "https://greyrock.github.io/greyrock-ops"
  visibility   = "public"

  auto_init              = true
  allow_merge_commit     = false
  allow_squash_merge     = true
  allow_auto_merge       = true
  delete_branch_on_merge = true

  has_issues   = true
  has_wiki     = false
  has_projects = false
  is_template  = false

  plaintext_secrets = merge(
    {},
    local.greyrock_bot_secrets,
    local.dockerhub_secrets

  )

  issue_labels_merge_with_github_labels = false
  issue_labels = concat(
    [
      { name = "area/ci", color = "72ccf3", description = "Issue relates to CI" },
      { name = "area/kubernetes", color = "72ccf3", description = "Issue relates to Kubernetes" },

      { name = "renovate/container", color = "ffc300", description = "Issue relates to a Renovate container update" },
      { name = "renovate/helm", color = "ffc300", description = "Issue relates to a Renovate helm update" },
    ],
    local.default_issue_labels
  )

  pages = {
    custom_404 = true
    html_url   = "https://greyrock.github.io/greyrock-ops/"
    status     = "built"
    url        = "https://api.github.com/repos/Doonga/greyrock-ops/pages"
    branch     = "gh-pages"
    path       = "/"
  }

  webhooks = [
    {
      events       = ["push"]
      url          = module.onepassword_item_flux.fields.github_webhook_url
      active       = true
      content_type = "json"
      secret       = module.onepassword_item_flux.fields.github_webhook_token
    }
  ]

  security_and_analysis = {
    advanced_security = "enabled"
  }
}

module "renovate-config" {
  source = "github.com/doonga/terraform-github-repository.git?ref=main"

  name        = "renovate-config"
  description = "Renovate configuration presets"
  topics      = ["renovate", "gitops", "ci"]
  visibility  = "public"

  auto_init              = true
  allow_merge_commit     = false
  allow_squash_merge     = true
  allow_auto_merge       = true
  delete_branch_on_merge = true

  has_issues   = true
  has_wiki     = false
  has_projects = false
  is_template  = false

  plaintext_secrets = merge(
    {},
    local.greyrock_bot_secrets
  )

  issue_labels_merge_with_github_labels = false
  issue_labels = concat(
    [],
    local.default_issue_labels
  )

  security_and_analysis = {
    advanced_security = "enabled"
  }
}

module "gh-workflows" {
  source = "github.com/doonga/terraform-github-repository.git?ref=main"

  name        = "gh-workflows"
  description = "A collection of reusable GitHub workflows"
  topics      = ["ci", "github", "workflows"]
  visibility  = "public"

  auto_init              = true
  allow_merge_commit     = false
  allow_squash_merge     = true
  allow_auto_merge       = true
  delete_branch_on_merge = true

  has_issues   = true
  has_wiki     = false
  has_projects = false
  is_template  = false

  plaintext_secrets = merge(
    {},
    local.greyrock_bot_secrets,
    local.dockerhub_secrets
  )

  issue_labels_merge_with_github_labels = false
  issue_labels = concat(
    [],
    local.default_issue_labels
  )

  security_and_analysis = {
    advanced_security = "enabled"
  }
}

module "terraform-1password-item" {
  source = "github.com/doonga/terraform-github-repository.git?ref=main"

  name        = "terraform-1password-item"
  description = "Terraform Module that collects all fields for a 1Password Item."
  topics      = ["terraform", "1password"]
  visibility  = "public"

  auto_init              = true
  allow_merge_commit     = false
  allow_squash_merge     = true
  allow_auto_merge       = true
  delete_branch_on_merge = true

  has_issues   = true
  has_wiki     = false
  has_projects = false
  is_template  = false

  plaintext_secrets = merge(
    {},
    local.greyrock_bot_secrets
  )

  issue_labels_merge_with_github_labels = false
  issue_labels = concat(
    [],
    local.default_issue_labels
  )

  security_and_analysis = {
    advanced_security = "enabled"
  }
}
