module "terraform_1password_item" {
  source = "github.com/doonga/terraform-github-repository?ref=v1.2.0"

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

  plaintext_secrets = merge(
    {},
    local.greyrock_bot_secrets
  )

  issue_labels_manage_default_github_labels = false
  issue_labels = concat(
    [],
    local.issue_labels_semver,
    local.issue_labels_category
  )
}
