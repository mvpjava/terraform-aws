# Public IP of the instance
output "ec2_public_ip" {
  description = "The public IP of the EC2 instance"
  value       = aws_instance.ec2[0].public_ip
}

# Private IP of the instance
output "ec2_private_ip" {
  description = "The private IP of the EC2 instance"
  value       = aws_instance.ec2[0].private_ip
}

# Instance ID
output "ec2_instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.ec2[0].id
}

# Public DNS hostname
output "ec2_public_dns" {
  description = "The public DNS of the EC2 instance"
  value       = aws_instance.ec2[0].public_dns
}

# Availability zone
output "ec2_az" {
  description = "The availability zone where the instance is running"
  value       = aws_instance.ec2[0].availability_zone
}
