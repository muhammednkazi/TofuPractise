Creating workspaces:-

env1.tfvars #file for passing variables to 1st workspace
env2.tfvars #file for passing variables to 2nd workspace

tofu workspace list #to list all exisitng workspaces
tofu workspace new workspace1 #to create and switch to new workspace

terraform.tfstate.d #this folder will be created after creating new workspace
    - workspace1 #workspace folder
        - terraform.tfstate #statefile for workspace1 environment
    - workspace2 #workspace folder
        - terraform.tfstate #statefile for workspace1 environment


tofu workspace show #Displays the currently active workspace

tofu workspace select <name> #Switches to an existing workspace

tofu workspace delete <name> #Deletes a workspace and its associated state

tofu plan -var-file=1stenv.tfvars
tofu apply -var-file=2ndenv.tfvars
