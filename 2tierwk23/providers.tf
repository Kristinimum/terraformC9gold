terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.30.0"
    }
  }
}

#Configure AWS provider
provider "aws" {
  region = var.aws_region
}