The `output block` in Terraform is used to define the values that should be displayed after a successful terraform apply. Outputs can be useful for displaying important information, such as IP addresses, URLs, or any other data that you might need after your infrastructure has been provisioned.

```
output "instance_ami_id" {
  description " give description"
  value = aws_instance.EC2_instance.ami
}
```

To see the output values, you can run `terraform output` command after applying your configuration. 

**************************

To format the output in a specific way, use the output block's attributes like sensitive to hide sensitive values.

```
output "db_password" {
  description = "The password for the database"
  value       = aws_secretsmanager_secret.example.secret_string
  sensitive   = true
}
```