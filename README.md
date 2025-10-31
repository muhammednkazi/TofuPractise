opentofu is a forked repository of terraform
as terraform changed is license from opensource to non open source

opentofu was created.

opentofu is almost similar to terraform
In terraform, Hashicorp Configuration Language (HCL) is used.
In Opentofu, Opentofu Configuration Language (OCL) is used.

steps:-
tofu init
tofu validate
tofu fmt
tofu plan
tofu apply
tofu destroy

all the code and commands are similar as terraform.

steps:-
1. create ubuntu ec2 instance on aws
2. install opentofu for ubuntu from official website on ec2.
3. create IAM user on AWS for interacting with AWS Services. e.g username: iacuser
4. grant CLI permission to this new user
5. install awscli package for ubuntu from aws offical website on ec2
5. type 'aws configure' to enter new user's username and password to interact with aws services.


once tofu is installed,
tofu -version - to check tofu version
tofu init -help - to know what tofu init does

main.tf file is popularly used to create tofu files.

tofu apply -auto-approve :- to skip confirmation before applying
tofu destroy -auto-approve :- to skip confirmation before destroying

documentation is not available yet for opentofu
so we can refer library.tf or terraform documentation.
library.tf is a website where we can find code regarding resouces.
it is a centralized place where we can find documentation for terraform, opentofu.

symbols:-
+ addition
- deletion
~ update in place (change or update)
