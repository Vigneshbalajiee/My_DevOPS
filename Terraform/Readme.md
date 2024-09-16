Terraform is an Infrastructure as Code (IaC) tool that allows you to define, manage, and provision infrastructure resources across various cloud providers and on-premises environments. Understanding the Terraform lifecycle is crucial for efficiently managing infrastructure. Here's an overview of the typical Terraform lifecycle:

### 1. **Write Configuration**
   - **HCL (HashiCorp Configuration Language):** Terraform configurations are written in HCL, which is a declarative language that describes the desired state of infrastructure.
   - **Modules:** Reusable and encapsulated collections of resources that can be shared and used across different projects.

### 2. **Initialize (terraform init)**
   - **Initialization:** Sets up the working directory containing Terraform configuration files. Downloads the necessary provider plugins, initializes the backend (where Terraform stores the state), and prepares the environment for subsequent commands.

### 3. **Plan (terraform plan)**
   - **Execution Plan:** Terraform compares the current state with the desired state defined in the configuration files. It generates an execution plan that details what actions will be taken to reach the desired state (e.g., what resources will be created, modified, or destroyed).
   - **Preview:** This step allows you to see what changes Terraform will make without actually applying them.

### 4. **Apply (terraform apply)**
   - **Provisioning:** Terraform applies the execution plan generated during the `plan` phase, creating, modifying, or destroying resources as necessary to achieve the desired state.
   - **Confirmation:** Before making any changes, Terraform asks for confirmation unless the `-auto-approve` flag is used.

### 5. **Manage State**
   - **State File:** Terraform maintains a state file (`terraform.tfstate`) that tracks the current state of your infrastructure. This file is critical for Terraform to manage resources accurately.
   - **Backend:** The state can be stored locally or remotely (e.g., in S3, Terraform Cloud, etc.) for collaboration and safety.

### 6. **Destroy (terraform destroy)**
   - **Teardown:** This command destroys all resources managed by Terraform, essentially reverting the infrastructure to its initial state before Terraform was applied.

### 7. **Repeat**
   - **Lifecycle Continuation:** As infrastructure requirements evolve, you'll return to the configuration files to make changes, repeat the plan and apply steps to update the infrastructure, and manage the state file continuously.

### 8. **Terraform Commands Overview**
   - **terraform init:** Initializes the working directory.
   - **terraform validate:** Validates the configuration files for syntax and logical errors.
   - **terraform plan:** Creates an execution plan.
   - **terraform apply:** Applies the changes to reach the desired state.
   - **terraform destroy:** Destroys the infrastructure managed by Terraform.
   - **terraform fmt:** Formats Terraform configuration files.
   - **terraform state:** Manipulates the state file (e.g., list, show, remove resources).


Understanding this lifecycle helps in efficiently managing the infrastructure and maintaining consistency across environments.


## VAULT

Terraform Vault refers to the integration of HashiCorp Vault, a secrets management tool, with Terraform, an infrastructure as code (IaC) tool. This integration allows Terraform to securely access, store, and manage sensitive information such as API keys, passwords, certificates, and other secrets.



DEV mode / Prod mode  : start server in respective mode 

`vault server -dev`

By default if we start the vault in DEV mode then it stores all the data in INMEMORY. But in PROD mode it stores in DISK or DATABASE

Store the UNSEAL key and Root token inorder to use later.

Export the vault address and the Root token

```
export VAULT_ADDR="XXXXXX"
export VAULT_TOKEN="XXXXXXXXXXXXX"

```

check the status of vault - `vault status`

### READ/WRITE/DELETE

Enable a path using Secret Engine - `vault secrets enable -path=my kv`

### Write the Secret 

`vault kv put my/path <key>=<value>`

- ***kv*** = type of data - Key-Value
- ***my/*** = Custom path where storing the data
- ***put*** = to Write the data

### Read the secrets

`vault kv get my/path`

### List all available secrets

`vault secrets list`

### Delete secrets

`vault kv delete my/path`

### Disable secrets

`vault secrets disable my`


#### Dynamic Secrets generaion

Enable aws path = `vault secrets enable -path=aws aws`

Set the Root Config using root Access and Secret key

```
vault write aws/config/root \
access_key="XXXXXXX"     \
secret_key="XXXXXXXX"     \
region="XXXXXXX"
```

Set up the role and generate dynamic secret to that role.

```
vault write aws/roles/my-ec2-role \
        credential_type=iam_user \
        policy_document=-EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Stmt1426528957000",
      "Effect": "Allow",
      "Action": [
        "ec2:*"
      ],
      "Resource": [
        "*"
      ]
    }
  ]
}
EOF
```

Generate access key and secret key for that role

```
vault read aws/creds/my-ec2-role
```

Revoke the secrets if you do not want it any longer

```
vault lease revoke <lease id>
```


Login Vault using below command with Root token
` vault login` - will ask token. Provide Root token that copied initially.

to revoke token
`vault token revoke <token>`






