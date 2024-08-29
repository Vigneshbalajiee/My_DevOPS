`Provisioners` in Terraform are used to execute scripts or commands on your infrastructure after it has been created. They can be useful for configuring instances, installing software, or performing other tasks that require interaction with the provisioned resources.

`local-exec:` Executes a command on the machine where Terraform is running.
```
resource "aws_instance" "example" {
    provisioner "local-exec" {
    command = "echo 'Instance created!'"
  }
}
```

`remote-exec:` Executes a command on the remote resource, such as an EC2 instance.
```
resource "aws_instance" "example" {
    provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y nginx"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("~/.ssh/id_rsa")
      host        = self.public_ip
    }
  }
}
```