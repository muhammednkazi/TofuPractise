terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.16.0"
    }
  }
}

provider aws {
  # Configuration options
}

resource "aws_instance" "example" {
  ami           = "ami-02d26659fd82cf299"
  instance_type = "t2.micro"
  key_name = "TofuPractise"

  tags = {
    Name = "HelloWorld"
  }
}
