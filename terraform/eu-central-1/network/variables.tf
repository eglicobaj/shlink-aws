locals {
  name           = "shlink"
  vpc_cidr_range = "10.10.0.0/16"

  azs             = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
  private_subnets = ["10.10.10.0/24", "10.10.20.0/24", "10.10.30.0/24"]
  public_subnets  = ["10.10.110.0/24", "10.10.120.0/24", "10.10.130.0/24"]
}

variable "ec2_key_name" {
  description = "Key pair name for SSH access"
  type        = string
  default     = "shlink-key"
}