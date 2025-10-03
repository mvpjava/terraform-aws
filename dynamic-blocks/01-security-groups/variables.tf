variable "region" {
  description = "AWS region to provision infrastructure in"
  type        = string
  default     = "eu-west-2"
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
  # !!! REPLACE WITH YOUR VPC-ID !!!
  default = "vpc-2f287947"
}

/*
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
*/

