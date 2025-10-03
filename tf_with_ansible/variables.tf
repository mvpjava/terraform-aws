variable "region" {
  description = "AWS region to provision infrastructure in"
  type        = string
  default     = "eu-west-2"
}

variable "vpc_id" {
  description = "VPC id to create resources in"
  type        = string
  #default     = "vpc-2f287947"  
}

variable "my_ssh_key" {
  description = "SSH Key for Ansible to perform configuration after EC2 has been created by Terraform"
  type        = string
  #default     = "WebTier-EC2-London-KeyPair"
}

variable "path_my_ssh_key" {
  description = "Path to SSH key"
  type        = string
  #default     = "/home/ec2-user/.ssh/WebTier-EC2-London-KeyPair.pem"
}

variable "username" {
  description = "Username when performing ssh"
  type        = string
  default     = "ec2-user"
}