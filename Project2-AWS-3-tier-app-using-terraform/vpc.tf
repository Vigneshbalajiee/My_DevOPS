module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "5.13.0"
  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["ap-south-1a", "ap-south-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]
  

  enable_nat_gateway = true
  single_nat_gateway = true
  enable_vpn_gateway = true
  enable_dns_hostnames = true
  enable_dns_support = true
  
  create_database_subnet_route_table = true
  create_database_subnet_group = true
  database_subnets = ["10.0.201.0/24", "10.0.202.0/24"]

    public_subnet_tags = {
    Type = "public-subnets"
  }

  private_subnet_tags = {
    Type = "private-subnets"
  }

  database_subnet_tags = {
    Type = "database-subnets"
  }

  vpc_tags = {
    Name = "vpc-dev"
  }

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}