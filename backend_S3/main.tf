# Minimal EC2 instance
resource "aws_instance" "ec2" {
  ami           = "ami-0336cdd409ab5eec4" # change if needed, depends on your region
  instance_type = "t3.micro"

  tags = {
    Name = "tf_ec2"
  }
}
