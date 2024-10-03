output "ecr_arn" {
  value       = aws_ecr_repository.this.arn
  description = " Full ARN of the repository"
}

output "ecr_registry_id" {
  value       = aws_ecr_repository.this.id
  description = "The registry ID where the repository was created"
}

output "ecr_repository_url" {
  value       = aws_ecr_repository.this.repository_url
  description = "The URL of the repository (in the form aws_account_id.dkr.ecr.region.amazonaws.com/repositoryName)"
}