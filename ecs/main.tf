terraform {
  backend "s3" {
    bucket = "opentofu-state-files-2025"
    key    = "ecs.tfstate"
    region = "ap-south-1"
  }
}

provider "aws" {
  region = "ap-south-1"
}

module "ecs_cluster" {
  source         = "./modules/ecs-cluster"
  cluster_name   = "my-ecs-cluster"
  image_name     = "abc" #replace with imagename
  image_uri      = "abc" #replace with ecr image uri
  container_port = 80
  host_port      = 80
}
