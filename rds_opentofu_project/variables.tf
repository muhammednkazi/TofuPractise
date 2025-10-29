
variable "db_name" {
  default = "mydb"
}

variable "db_username" {
  default = "admin"
}

variable "db_password" {
  default = "Capgemini2025"
}

variable "db_instance_class" {
  default = "db.t4g.micro"
}

variable "db_engine" {
  default = "mysql"
}

variable "db_engine_version" {
  default = "8.0"
}

variable "allocated_storage" {
  default = 20
}

variable "vpc_security_group_ids" {
  default = ["sg-0f37977eca82c08fc"]
}
