terraform {
    backend "s3" {
        bucket = "SHLINK_STATE_BUCKET_NAME"
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