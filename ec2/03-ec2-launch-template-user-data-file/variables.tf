variable "server_port" {
  description = "SG Inbound port number"
  type        = number
  default     = 80
}

variable "ec2_instance_type" {
  description = "EC2 Instance Type"
  type        = string
  default     = "t2.micro"
}

variable "ec2_image_id" {
  description = "EC2 AMI Image ID"
  type        = string
  default     = "ami-0c0493bbac867d427"
}

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