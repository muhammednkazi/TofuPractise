Tofu Refresh:-

Run below commands:-
tofu init
tofu fmt
tofu validate
tofu plan
tofu apply

An EC2 instance will be created.
Now update the instance type from t2.micro to t2.medium from aws console.
This is known as Drift.

Now we have to detect the drift from tofu.
Run below commands to detect the drift.

tofu plan -refresh-only :-
detects and displays the differences (drift) between your current Terraform state file and the actual deployed infrastructure.

tofu apply -refresh-only :-
updates the Terraform state file to reflect the real-world infrastructure's current configuration.

No Code Modification: The refresh operation only modifies the state file; it does not change your actual code. We have to manually update the code.
