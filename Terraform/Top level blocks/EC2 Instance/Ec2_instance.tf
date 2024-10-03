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
     key_name = "sample"
     connection {
        type = "ssh"
        user = "ubuntu"
        private_key = file("C:\\Users\\vigne\\.ssh\\id_rsa")
      host = self.public_ip

     }
    // user_data = file("${path.module}/nginx.sh")
     provisioner "remote-exec" {
       inline = [ "ls",
       "touch hello.txt" ]
     }
     
}

output "name" {
  value = aws_instance.EC2_instance.ami
}

resource "aws_key_pair" "name" {
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDhhouTVUdUtXOfAa0GNskxDUuOV6wBx9XX/vwaCAjTiyrez7Ko19epoAlX5N5TZ2m76i5vKeKX2PvR6Ht2aPiD+LOTL86LtQ3rEdEyrH+t32RDOq08laxkp1YLG8zvzdgTeJWw/iq4e8DRbsiCVv6XCgZ0nbip1J2CiNOECyo5EZTw8Ff4epP8bXjpifMT8cxti/x1O8YaeWWYA8QYCX8ITPNK9ZI3CZAts5f0/QeatYLuKFPAli16V05xtm1EFMg4EEruTEn3nDbQpz6rNhu77WVklaaS4Hbc+DUQk4MzodH4lDSvI4jsJDnqyYM+yWX5gm+2QBHYEk5jXumxDSFYusdTeL66LMNmqz/2+4nkepRZWQpbi7muvTkU2EK0sILuaqEHjMUz5L9w3QcVt8dHx7D075IZScC9UNO7OjTxKU0mHTB2Jg3Ha02Dm5X1eg8gzCtDhDMLtHyPmyguQGjB7XRhuDQcIwdZd+Z2FH7QAymk6MQsnTaChVgTuBl5x8c= vigne@DESKTOP-J5P22PM"
  key_name = "sample"
  
}
