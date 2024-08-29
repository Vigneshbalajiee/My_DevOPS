In Terraform, modules are a way to organize and reuse configuration code. They used to create, manage, and scale infrastructure in a more modular and manageable way.

A module is essentially a container for multiple resources that are used together. Modules can be used to create reusable components and to manage infrastructure components in a consistent and organized way.

## Components of a Terraform Module

- ***Root Module:*** The main configuration that is defined in a .tf file. It's the entry point of the Terraform configuration.

- ***Child Modules:*** These are modules used within other modules. we can define these in separate directories or use modules from the Terraform Registry or other sources.

- ***Module Block:*** A block in our configuration that calls a module. It includes parameters to pass variables and get outputs from the module.

## Basic Structure of a Module

**Directory Structure:** Typically, a module is structured with its own directory. Inside this directory, we will have one or more .tf files.

```
my-module/
├── main.tf
├── variables.tf
├── outputs.tf
└── README.md
main.tf: Contains the primary resources and configuration for the module.

```

- **variables.tf:** Defines the input variables that the module accepts.

- **outputs.tf:** Defines the outputs that the module provides to other modules or to the root module.

- **README.md:** Optional but useful for documentation about how to use the module.

Example of Using a Module

in module/vpc/main.tf
```
resource "aws_vpc" "example" {
  cidr_block = var.cidr_block
  tags = {
    Name = "example-vpc"
  }
}
```
in module/vpc/variable.tf

```
variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}
```

in module/vpc/output.tf

```
output "vpc_id" {
  value = aws_vpc.example.id
}
```

in main.tf
```
module "vpc" {
  source    = "./modules/vpc"
  cidr_block = "10.0.0.0/16"
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

```

### Key Points

**Reusability:** Modules can be reused across different configurations or projects, promoting consistency and reducing duplication.
**Encapsulation:** Modules encapsulate related resources, making your configurations more readable and easier to manage.
**Versioning:** You can version your modules and use specific versions to ensure stability in your infrastructure.