The `for` expression can be used within Terraform configurations to generate **lists or maps** dynamically.

 ```
 output "display_details" {
  value = [for instance in aws_instance.ec2: instance.public_ip]
}
```