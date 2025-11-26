tofu import:-

Suppose an ec2 instance is already created on aws console without using tofu.

Now, we have to import this ec2 into our tofu code and statefile so to manage it using tofu and not from aws console.

1st method:-


provider.tf:-
provider "aws" {
  region = "ap-south-1"
}

tofu init

main.tf :-
import {
  id = "i-01f2bfcb6ba605ab5" #mention your instance id
  to = aws_instance.example #resource block
}

tofu plan -generate-config-out=generated_resources.tf

generated_resources.tf will be created which will have instance ec2 instance code.
copy this code to your main.tf and delete existing code.
also, delete generated_resources.tf file.

till now our code file is updated.
now, we have to update our statefile.

on terminal run below command

tofu import aws_instance.example i-01f2bfcb6ba605ab5

now statefile will be updated.

now we have code as well as statefile is also updated.

now run 
tofu plan

if any error comes then resolve the issue by checking the parameters.


Second method:-

provider.tf:-
provider "aws" {
  region = "ap-south-1"
}

tofu init

main.tf:-
resource "aws_instance" "example"{

}

on terminal run below command,

tofu import aws_instance.example i-01f2bfcb6ba605ab5
replace id with your instance id.

till now our statefile is updated.
now, we have to update our code.

on terminal run below command,
tofu plan

it will throw error, missing mandatory paramters
copy those parameters and values from state file and paste in resource block of main.tf
run tofu plan

o/p:-Your insfrasturce is uptodate.
