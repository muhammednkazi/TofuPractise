resource "aws_instance" "example" {
  ami           = "ami-02d26659fd82cf299"
  instance_type = "t2.medium"
  key_name      = "TofuPractise"

  tags = {
    Name = "HelloWorld"
  }
}
