resource "aws_security_group" "my_SG_2" {
    name = "my_SG_2"
    tags = {
        Name = "my_SG_2"
    }
dynamic "ingress"{
for_each = [ local.ingress ]
content {
    from_port = ingress.value.port
    to_port = ingress.value.port
    description = ingress.value.description
    cidr_blocks = ["0.0.0.0/0"]
    protocol = "tcp"
}
}
}



