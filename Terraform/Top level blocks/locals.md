In Terraform, the `locals block` is used to define local values that can be reused throughout your configuration. These values are computed once and can simplify your configuration by avoiding repetition.

## Syntax

### string local
```
locals {
  region = "us-west-2"
  instance_type = "t2.micro"
  ami_id = "ami-12345678"
}

resource "aws_instance" "example" {
  ami           = local.ami_id
  instance_type = local.instance_type
  region        = local.region
}
```

### list local

```
locals {
  regions = ["us-east-1", "us-west-2"]
}

output "regions" {
  value = local.regions
}
```

### map local

```
locals {
  ingress = {
    port        = 22
    description = "enable SSH"
  }
}

resource "aws_security_group" "my_SG_2" {
  name = "my_SG_2"
  
  tags = {
    Name = "my_SG_2"
  }

  ingress {
    from_port   = local.ingress.port
    to_port     = local.ingress.port
    protocol    = "tcp"  # You should specify the protocol
    cidr_blocks = ["0.0.0.0/0"]  # Define CIDR blocks or source security groups
    description = local.ingress.description
  }
}
```
## list of maps local
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
```


### ***Locals are immutable i.e. once the values are defines it can't be changed. it is limited to modules. Can't used outside the modules.***