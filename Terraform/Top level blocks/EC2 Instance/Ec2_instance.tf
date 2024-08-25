terraform {
  required_providers {
    aws={
        source = "hashicorp/aws"
        version = "> 3.0"
    }
  }
}

provider "aws" {
    region = "ap-south-1"
  
}

resource "aws_instance" "EC2_instance" {
     ami = "ami-0522ab6e1ddcc7055"
     instance_type = "t2.micro"
     tags = {
       Name = "terraform_demo"
     }
     user_data = file("${path.module}/nginx.sh")
}