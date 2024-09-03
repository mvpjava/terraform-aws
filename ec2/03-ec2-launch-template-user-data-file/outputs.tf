output "public_ip" {
  /* 
    Since the aws_instance.terraform-ec2 resource is defined with the count attribute, 
    which means there can be multiple instances of this resource. 
    To correctly reference the public IP of a specific instance, you need to specify the index of the instance you're interested in.
  */
  value       = aws_instance.apache-webserver[0].public_ip
  description = "EC2 public IP to view deployed Web Server"
}

output "security_group" {
  value       = aws_security_group.allow-http.id
  description = "EC2 instances Security Group ID"
}