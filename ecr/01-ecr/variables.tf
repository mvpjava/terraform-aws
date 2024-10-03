variable "region" {
  description = "AWS region to provision infrastructure in"
  type        = string
  default     = "eu-west-2"
}

variable "access_key" {
  description = "IAM access key"
  type        = string
  sensitive   = true
}

variable "secret_key" {
  description = "IAM secret key"
  type        = string
  sensitive   = true
}

variable "ecr_repo_name" {
  description = "ECR Repository Name"
  type        = string
  default     = "my-repo"
}