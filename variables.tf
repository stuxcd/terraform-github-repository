################################################################################
# REPOSITORY
################################################################################

variable "repository_name" {
  description = "The name of the GitHub repository"
  type        = string
}

variable "repository_description" {
  description = "The description of the GitHub repository"
  type        = string
  default     = "Managed by Terraform"
}

variable "repository_visibility" {
  description = "Indicates the visibility of the repository"
  type        = string
  default     = "private"
}

################################################################################
# BRANCHES
################################################################################

variable "branch_protection" {
  description = "A list of branch protection maps for each rule to create. GitHub Pro needed for private repositories"
  type        = list(any)
  default     = []
}

################################################################################
# TEAMS
################################################################################

variable "teams" {
  description = "A list of team maps for each team repository to create"
  type        = list(any)
  default     = []
}

################################################################################
# SECRETS
################################################################################

variable "action_secrets" {
  description = "A list of secret maps for each action secret to create"
  type        = list(any)
  default     = []
}

variable "dependabot_secrets" {
  description = "A list of secret maps for each dependabot secret to create"
  type        = list(any)
  default     = []
}
