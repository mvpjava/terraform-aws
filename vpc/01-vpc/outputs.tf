output "vpc_id" {
  value       = aws_vpc.this.id
  description = "VPC ID"
}

#The [*] iterates over a list of objects or resources and extracts a specific attribute from each element.
output "vpc_public_subnets" {
  value       = aws_subnet.public[*].id
  description = "List of public subnet created"
}

output "vpc_private_subnets" {
  value       = aws_subnet.private[*].id
  description = "List of private subnet created"
}