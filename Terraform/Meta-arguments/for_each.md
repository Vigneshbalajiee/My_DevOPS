The `for_each` meta-argument in Terraform is used to create multiple resources or modules based on a ***set of values, such as a list or a map***. It allows you to iterate over each item in the set and create a resource or module instance for each one.

```
variable "instance_types" {
  default = ["t2.micro", "t2.small", "t2.medium"]
}

resource "aws_instance" "example" {
  for_each = toset(var.instance_types)
  ami           = "ami-12345678"
  instance_type = each.value
}
```
In this example, aws_instance.example will create one EC2 instance for each instance type specified in the instance_types variable.

### for MAPS

```
locals {
  instances = {
    "small"  = "t2.small"
    "medium" = "t2.medium"
    "large"  = "t2.large"
  }
}

resource "aws_instance" "example" {
  for_each = local.instances
  ami           = "ami-12345678"
  instance_type = each.value
  tags = {
    Name = each.key
  }
}
```
Within the resource block, we can use each.key and each.value to access the current element's key and value.

***each.key*** refers to the key of the current item (useful with maps).
***each.value*** refers to the value of the current item.