
provider "aws" {
  region = "ap-south-1" # Change as needed
}

module "ecr" {
  source               = "./modules/ecr"
  repository_name      = "my-modular-ecr"
  image_tag_mutability = "IMMUTABLE"
  scan_on_push         = true
  tags = {
    Environment = "Dev"
    Project     = "OpenTofu-ECR"
  }
}
