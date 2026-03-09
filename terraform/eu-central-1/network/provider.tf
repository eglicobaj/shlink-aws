terraform {
    backend "s3" {
        bucket = "aws-s3-demo-egli"
        key    = "terraform/eu-central-1/network"
        region = "eu-central-1" 
    }
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "~> 6.0"
      }
    }
}

provider "aws" {
  region = "eu-central-1"
}