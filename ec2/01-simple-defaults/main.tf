terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.64.0"
    }
  }
}

provider "aws" {
  region = "eu-west-2"
}

resource "aws_instance" "terrafform-ec2" {
  ami               = "ami-0c0493bbac867d427"
  count             = 1
  availability_zone = "eu-west-2b"
  instance_type     = "t2.micro"

  tags = {
    env = "demo"
  }
}
