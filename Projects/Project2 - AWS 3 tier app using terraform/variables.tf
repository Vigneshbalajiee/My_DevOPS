variable "region" {
  default = "ap-south-1"
}

# Environment Variable
variable "env" {
  description = "Environment Variable used as a prefix"
  type = string
  default = "dev"
}
