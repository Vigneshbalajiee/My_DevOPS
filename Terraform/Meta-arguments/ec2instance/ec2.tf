terraform {
  required_providers {
    aws={
        source = "hashicorp/aws"
        version = "> 3.0"
        
    }

  }
}
provider "aws" {
    region = var.aws_region
  
}

resource "aws_instance" "ec2" {
    ami = data.aws_ami.ami_id.id
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.my_SG_2.id]
   /* for_each = toset(data.aws_availability_zones.zones.names)
    availability_zone = each.key
    tags={
      Name = "Ec2_${each.value}"
    } */
}

locals {
  ingress=[{
    port = 22
    description = "enable SSH"
},
    {
    port = 80
    description = "enable hhtp" }]
}

output "display_details" {
  value = aws_instance.ec2.public_ip
}

