terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.14.1"
    }
  }

  backend "s3" {
    bucket  = "terraform-backend-state-16000" # Replace with actual bucket name from script
    key     = "terraform.tfstate"             #copied to S3 with this filename (key name)
    region  = "eu-west-2"
    encrypt = true
  }
}