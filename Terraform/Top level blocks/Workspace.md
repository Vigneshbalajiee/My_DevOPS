
Terraform `workspaces` are a feature in Terraform that allow you to manage multiple environments (like development, staging, and production) using the same configuration code. They provide a way to isolate your state files and manage different versions of infrastructure without having to maintain separate codebases.

By default, Terraform has a workspace called `default`

State Files: Each workspace has its own state file, which keeps track of the resources managed by Terraform. This isolation ensures that changes in one workspace don’t affect another.

Commands:

`terraform workspace list` - lists all workspace

`terraform workspace new <name>` - creates the new workspace

`terraform workspace show` - shows currect workspace

`terraform workspace select <name>` - switch to 

`terraform workspace delete <name>` - to delete the workspace