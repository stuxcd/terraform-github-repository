################################################################################
# EKS
################################################################################

output "repository_id" {
  description = "The identifier of the GitHub repository"
  value       = module.repository.repository_id
}
