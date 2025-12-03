terraform {
  required_version = ">=1.6.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

# --- VPC MODULE ---
module "vpc" {
  source              = "./modules/vpc"
  region              = var.region
  name                = var.project_name
  vpc_cidr            = "10.0.0.0/16"
  public_subnet_cidr  = "10.0.1.0/24"
  private_subnet_cidr = "10.0.2.0/24"
  availability_zone_a = "ap-south-1a"
  availability_zone_b = "ap-south-1b"
}


# --- EC2 MODULE ---
module "ec2" {
  source             = "./modules/ec2"
  name               = var.project_name
  ami                = var.ami
  instance_type      = var.instance_type
  key_name           = var.key_name
  vpc_id             = module.vpc.vpc_id
  public_subnet_id   = module.vpc.public_subnet_id
  private_subnet_id  = module.vpc.private_subnet_id
}

