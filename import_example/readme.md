tofu import:-

Suppose an ec2 instance is already created on aws console with using tofu.

Now, we have to import this ec2 into our tofu code and statefile so to manage it using tofu and not from aws console.

create a main.tf file with below code :-

provider "aws" {
  region = "ap-south-1"
}

import {
  id = "i-01f2bfcb6ba605ab5" #mention your instance id
  to = aws_instance.example #resource block
}

tofu plan -generate-config-out=generated_resources.tf

generated_resources.tf will be created which will have instance ec2 instance code.
copy this code to your main.tf and delete this file.

till now our code file is updated.
now, we have to update our statefile.

on terminal run below command

tofu import aws_instance.example i-01f2bfcb6ba605ab5

now statefile will be updated.

now we have code as well as statefile is also updated.

now run 
tofu plan

if any error comes then resolve the issue by checking the parameters.
