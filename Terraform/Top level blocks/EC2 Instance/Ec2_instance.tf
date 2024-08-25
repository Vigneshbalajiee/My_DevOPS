terraform {
  required_providers {
    aws={
        source = "hashicorp/aws"
        version = "> 3.0"
    }
  }
}

provider "aws" {
    region = var.region
  
}

resource "aws_instance" "EC2_instance" {
     ami = data.aws_ami.aws_ami.id
     instance_type = var.ec2_type
     vpc_security_group_ids = [aws_security_group.my-SG.id]
     tags = {
       Name = "terraform_demo"
     }
     user_data = file("${path.module}/nginx.sh")
     
     
}