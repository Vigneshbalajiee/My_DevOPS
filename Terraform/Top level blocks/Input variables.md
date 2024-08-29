In Terraform, an `input variable block` allows us to define parameters that can be passed into the configuration. This makes the Terraform code more flexible and reusable by letting us customize the values without changing the code itself.

```
variable "ec2_type" {
  description = "type of instance going to use"
  default = "t2.micro"
}

variable "region" {
    description = "variable to define region"
    default = "ap-south-1"  
}
```

usage in `Command Line:` Use -var flag when running terraform apply or terraform plan:
`terraform apply -var="instance_type=t3.micro"`

usage in `tfvars` file: Create a file named terraform.tfvars or any other .tfvars file
`instance_type = "t3.micro"`
and give in command `terraform apply -var-file="file.tfvars"`
