# outputs.tf

# Security Group ID
output "security_group_id" {
  description = "The ID of the security group"
  value       = aws_security_group.dynamic_sg.id
}

# Security Group Name
output "security_group_name" {
  description = "The name of the security group"
  value       = aws_security_group.dynamic_sg.name
}

# VPC ID
output "security_group_vpc_id" {
  description = "The VPC ID where the security group is created"
  value       = aws_security_group.dynamic_sg.vpc_id
}

# Ingress rules
output "security_group_ingress" {
  description = "List of ingress rules in the security group"
  value       = aws_security_group.dynamic_sg.ingress
}

# Egress rules
output "security_group_egress" {
  description = "List of egress rules in the security group"
  value       = aws_security_group.dynamic_sg.egress
}

# Security Group ARN
output "security_group_arn" {
  description = "The ARN of the security group"
  value       = aws_security_group.dynamic_sg.arn
}
