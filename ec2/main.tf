resource "aws_instance" "example" {
  #count         = 2
  ami           = "ami-02d26659fd82cf299"
  instance_type =  "t2.micro" #var.env == "dev" ? "t2.micro" : "t2.medium"
  key_name      = "TofuPractise"

  tags = {
    Name = "demo" #"Instance-${count.index+1}"
  }
}


variable "env" {
  
}
