# GitHub Repository Terraform module :space_invader:

Terraform module which creates a GitHub repository.

## Usage

```hcl
module "repository" {
  source = "github.com/stuxcd/terraform-github-repository"

  ## required
  repository_name = "test"

  ## optional
  repository_visibility  = "private" 
  repository_description = "This is a test repository"
  branch_protection = [{
    branch   = "main"
    contexts = ["some-workflow"]
  }]
  teams = [{
    id         = github_team.foo.id
    permission = "push"
  }]
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_github"></a> [github](#requirement\_github) | >= 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_github"></a> [github](#provider\_github) | 4.31.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [github_actions_secret.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_secret) | resource |
| [github_branch_protection.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_protection) | resource |
| [github_dependabot_secret.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/dependabot_secret) | resource |
| [github_repository.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |
| [github_team_repository.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/team_repository) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_action_secrets"></a> [action\_secrets](#input\_action\_secrets) | A list of secret maps for each action secret to create | `list(any)` | `[]` | no |
| <a name="input_branch_protection"></a> [branch\_protection](#input\_branch\_protection) | A list of branch protection maps for each rule to create. GitHub Pro needed for private repositories | `list(any)` | `[]` | no |
| <a name="input_dependabot_secrets"></a> [dependabot\_secrets](#input\_dependabot\_secrets) | A list of secret maps for each dependabot secret to create | `list(any)` | `[]` | no |
| <a name="input_repository_description"></a> [repository\_description](#input\_repository\_description) | The description of the GitHub repository | `string` | `"Managed by Terraform"` | no |
| <a name="input_repository_name"></a> [repository\_name](#input\_repository\_name) | The name of the GitHub repository | `string` | n/a | yes |
| <a name="input_repository_visibility"></a> [repository\_visibility](#input\_repository\_visibility) | Indicates the visibility of the repository | `string` | `"private"` | no |
| <a name="input_teams"></a> [teams](#input\_teams) | A list of team maps for each team repository to create | `list(any)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_repository_id"></a> [repository\_id](#output\_repository\_id) | The identifier of the GitHub repository |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
