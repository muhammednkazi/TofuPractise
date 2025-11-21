output "repository_url" {
  value       = module.ecr.repository_url
  description = "URL of the ECR repository"
}

output "repository_arn" {
  value       = module.ecr.repository_arn
  description = "ARN of the ECR repository"
}