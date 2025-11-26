Tofu Refresh

tofu plan -refresh-only :-
detects and displays the differences (drift) between your current Terraform state file and the actual deployed infrastructure.

tofu apply -refresh-only :-
updates the Terraform state file to reflect the real-world infrastructure's current configuration.

No Infrastructure Modification: The refresh operation only modifies the state file; it does not change your actual remote infrastructure resources.