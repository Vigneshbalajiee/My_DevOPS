```
variable "ec2_type" {
  description = "type of instance going to use"
  default = "t2.micro"
}

variable "region" {
    description = "variable to define region"
    default = "ap-south-1"  
}