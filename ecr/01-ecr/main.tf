resource "aws_ecr_repository" "this" {
  name                 = var.ecr_repo_name
  image_tag_mutability = "MUTABLE"

  tags = {
    name = "ECR template by TerraFrom"
    env  = "demo"

  }
}