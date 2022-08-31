################################################################################
# PROVIDER
################################################################################

provider "github" {}

################################################################################
# TEAM
################################################################################

resource "github_team" "foo" {
  name        = "foo"
  description = "This is a test team"
}

################################################################################
# REPOSTIROY
################################################################################

module "repository" {
  source = "../.."

  ## required
  repository_name = "test"

  ## optional
  repository_description = "This is a test repository"
  branch_protection = [{
    branch   = "main"
    contexts = ["pre-commit"]
  }]
  teams = [{
    id         = github_team.foo.id
    permission = "push"
  }]
}
