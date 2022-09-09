################################################################################
# REPOSITORY
################################################################################

resource "github_repository" "this" {
  name        = var.repository_name
  description = var.repository_description
  visibility  = var.repository_visibility

  # features
  has_issues           = true
  has_projects         = false
  has_wiki             = false
  has_downloads        = true
  vulnerability_alerts = true

  # merge strategy
  allow_merge_commit = false
  allow_rebase_merge = false

  lifecycle {
    prevent_destroy = true
  }
}

################################################################################
# BRANCH PROTECTION
################################################################################

locals {
  branch_protection_length = length(var.branch_protection)
  branch_protection = merge(flatten([for i in range(local.branch_protection_length) :
    { for entry in var.branch_protection : format("%s.%s", lookup(entry, "branch"), i) => entry }
  ])...)
}

resource "github_branch_protection" "this" {
  for_each = local.branch_protection

  repository_id = github_repository.this.id
  pattern       = lookup(each.value, "branch")

  required_status_checks {
    strict   = true
    contexts = lookup(each.value, "contexts", [])
  }
}

################################################################################
# TEAMS
################################################################################

locals {
  teams_length = length(var.teams)
  teams = merge(flatten([for i in range(local.teams_length) :
    { for entry in var.teams : format("%s.%s", lookup(entry, "permission", "pull"), i) => entry }
  ])...)
}

resource "github_team_repository" "this" {
  for_each = local.teams

  team_id    = try(lookup(each.value, "id"), lookup(each.value, "name"))
  repository = github_repository.this.name
  permission = lookup(each.value, "permission")
}

################################################################################
# SECRETS
################################################################################

locals {
  action_secrets_length = length(var.action_secrets)
  action_secrets = merge(flatten([for i in range(local.action_secrets_length) :
    { for entry in var.action_secrets : format("%s.%s", lookup(entry, "name"), i) => entry }
  ])...)

  dependabot_secrets_length = length(var.dependabot_secrets)
  dependabot_secrets = merge(flatten([for i in range(local.dependabot_secrets_length) :
    { for entry in var.dependabot_secrets : format("%s.%s", lookup(entry, "name"), i) => entry }
  ])...)
}

resource "github_actions_secret" "this" {
  for_each = local.action_secrets

  repository      = github_repository.this.name
  secret_name     = lookup(each.value, "name")
  plaintext_value = lookup(each.value, "value")
}

resource "github_dependabot_secret" "this" {
  for_each = local.dependabot_secrets

  repository      = github_repository.this.name
  secret_name     = lookup(each.value, "name")
  plaintext_value = lookup(each.value, "value")
}
