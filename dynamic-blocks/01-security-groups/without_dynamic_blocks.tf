# This is the old statc way (no dynamic blocks)

# Create Security Group
resource "aws_security_group" "static_sg" {
  name        = "static-sg"
  description = "Security group created with static blocks"
  vpc_id      = var.vpc_id # !!! TODO replace with your VPC ID !!!

  # Static ingress rules
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Static egress rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "terraform-static-sg"
  }
}
