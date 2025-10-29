
provider "aws" {
  region = "ap-south-1"
}

module "rds" {
  source                = "./modules/rds"
  db_name               = var.db_name
  db_username           = var.db_username
  db_password           = var.db_password
  db_instance_class     = var.db_instance_class
  db_engine             = var.db_engine
  db_engine_version     = var.db_engine_version
  allocated_storage     = var.allocated_storage
  vpc_security_group_ids = var.vpc_security_group_ids
}
