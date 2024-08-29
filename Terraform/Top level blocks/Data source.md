In Terraform, a `data source block` allows us to fetch data from external sources and use that data in your Terraform configuration. This is useful for dynamically retrieving information that can be used to configure resources or modules.

```
data "aws_ami" "aws_ami" {
  most_recent = true
  owners = ["amazon"]
  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-*"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  
}
```

Here, `aws_ami` fetches the most recent AMI_ID for the Ubuntu image with name starts with `ubuntu/images/hvm-ssd-gp3/ubuntu-noble-*` along with other filters