################################################################################
# REPOSITORY
################################################################################

output "repository_id" {
  value       = github_repository.this.id
  description = "The identifier of the GitHub repository"
}
