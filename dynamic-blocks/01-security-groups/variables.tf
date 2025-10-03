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

# Ingress rules variable with default
variable "ingress_rules" {
  description = "List of ingress rules for the security group"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

# Egress rules variable with default
variable "egress_rules" {
  description = "List of egress rules for the security group"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

