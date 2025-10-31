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
module "vpc1" {
  source              = "./modules/vpc"
  region              = var.region
  name                = var.project_name[0]
  vpc_cidr            = "10.0.0.0/16"
  public_subnet_cidr  = "10.0.1.0/24"
  #private_subnet_cidr = "10.0.2.0/24"
  availability_zone_a = "ap-south-1a"
  #availability_zone_b = "ap-south-1b"
}

# --- EC2 MODULE ---
module "ec21" {
  source            = "./modules/ec2"
  name              = var.project_name[0]
  ami               = var.ami
  instance_type     = var.instance_type
  key_name          = var.key_name
  vpc_id            = module.vpc1.vpc_id
  public_subnet_id  = module.vpc1.public_subnet_id
  #private_subnet_id = module.vpc1.private_subnet_id
}

# --- VPC MODULE ---
module "vpc2" {
  source              = "./modules/vpc"
  region              = var.region
  name                = var.project_name[1]
  vpc_cidr            = "192.168.0.0/16"
  public_subnet_cidr  = "192.168.1.0/24"
  #private_subnet_cidr = "192.168.2.0/24"
  availability_zone_a = "ap-south-1a"
  #availability_zone_b = "ap-south-1b"
}

# --- EC2 MODULE ---
module "ec22" {
  source            = "./modules/ec2"
  name              = var.project_name[1]
  ami               = var.ami
  instance_type     = var.instance_type
  key_name          = var.key_name
  vpc_id            = module.vpc2.vpc_id
  public_subnet_id  = module.vpc2.public_subnet_id
  #private_subnet_id = module.vpc2.private_subnet_id
}

module "peering" {
  source                    = "./modules/peering"
  requester_vpc_id          = module.vpc1.vpc_id
  accepter_vpc_id           = module.vpc2.vpc_id
  requester_cidr            = module.vpc1.vpc_cidr_value #"10.0.0.0/16"
  accepter_cidr             = module.vpc2.vpc_cidr_value #"10.1.0.0/16"
  requester_route_table_id  = module.vpc1.route_table_id # "rtb-abc123"
  accepter_route_table_id   = module.vpc2.route_table_id #"rtb-def456"
  #peer_region               = var.region
  auto_accept               = true
  peering_name              = "my-vpc-peering"
  create_routes             = true
}