Dynamic blocks in Terraform allows us to create multiple nested blocks based on a ***list or map*** of values. They are useful when we need to generate a block multiple times but the number of repetitions or content may vary.

```
locals {
  ingress=[{
    port = 22
    description = "enable SSH"
},
    {
    port = 80
    description = "enable hhtp" }]
}

resource "aws_security_group" "my_SG_2" {
    name = "my_SG_2"
    tags = {
        Name = "my_SG_2"
    }
dynamic "ingress"{
for_each = local.ingress
content {
    from_port = ingress.value.port
    to_port = ingress.value.port
    description = ingress.value.description
    cidr_blocks = ["0.0.0.0/0"]
    protocol = "tcp"
}
}
}
```

`for_each = local.ingress:` This iterates over the list of ingress rules defined in the local block.

`ingress.value:` Accesses the current item in the iteration, allowing you to reference port and description.

This will dynamically create ingress rules for the specified ports and descriptions.
