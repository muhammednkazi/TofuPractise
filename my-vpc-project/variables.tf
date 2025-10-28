variable "region" {
  default = "ap-south-1"
}

variable "project_name" {
  default = "demo-vpc"
}

variable "ami" {
  description = "AMI ID for EC2"
  default     = "ami-02d26659fd82cf299" # Example ubuntu
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  description = "TofuPractise"
}
