variable "aws_region" {
  type    = string
  default = "eu-central-1"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "key_name" {
  type        = string
  description = "Name of an existing EC2 Key Pair in AWS"
}

variable "ssh_cidr" {
  type    = string
  default = "0.0.0.0/0"
}
