resource "aws_launch_template" "apache-launch-template" {
  name = "apache-launch-template"
  image_id = "ami-0c0493bbac867d427"
  instance_type = "t2.micro"

  block_device_mappings {
    device_name = "/dev/sdf"

    ebs {
      volume_size = 10
      volume_type = "gp3"
    }
  }
 
  vpc_security_group_ids = [ aws_security_group.allow-http.id ]

  tag_specifications {
    resource_type = "instance"

    tags = {
      name = "my-terraform-instance"
      env  = "demo"
    }
  }

  user_data = filebase64("ec2-userdata.sh")
}


resource "aws_instance" "apache-webserver" {
  count             = 1
  availability_zone = "eu-west-2b"  
  user_data_replace_on_change = true

  launch_template {
    id = aws_launch_template.apache-launch-template.id
    version = "$Latest"
  }
}

resource "aws_security_group" "allow-http" {
  name = "app-web-sg-allow-http"

  ingress  {
    from_port = var.server_port
    to_port = var.server_port
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    env = "demo"
  }

}