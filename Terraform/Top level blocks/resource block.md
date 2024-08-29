A Terraform `resource block` is used to define a resource in the infrastructure. It tells Terraform how to create, update, or delete a resource. Each resource block specifies the type of resource and its configuration options.

```
resource "aws_instance" "my_ec2_instance" {
  ami           = "ami-08c40ec9ead489470"
  instance_type = "t2.micro"

  tags = {
    Name = "FirstEC2Instnace"
  }
}
```
- ***resource:*** This keyword is used to define a resource block.
- ***aws_instance:*** The resource type, which in this case is an AWS EC2 instance.
- ***my_ec2_instance:*** A user-defined name for the resource, which can be referenced later in the configuration.
- ***ami:*** The Amazon Machine Image (AMI) ID used to launch the instance.
- ***instance_type:*** The type of EC2 instance to launch.
- ***tags:*** Metadata tags for the resource.