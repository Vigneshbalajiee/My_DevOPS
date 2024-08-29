In Terraform, the `count` parameter is used to specify the number of instances of a resource or module to create. It's particularly useful for creating multiple instances of a resource without duplicating code.

```
resource "aws_instance" "EC2" {
  count = 3

  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  tags = {
    Name = ec2-${count.index}"
  }
}
```

The `count` parameter is set to 3, so Terraform will create three instances of the aws_instance resource.
`${count.index} `is a special variable that provides the index of the current instance (0, 1, 2, etc.), which you can use to differentiate between instances.