terraform {
  cloud {
    organization = "grinnyninnytformcloud"

    workspaces {
      name = "two-tier-arch"
    }
  }
  required_providers {
    aws = {
      version = "5.30.0"
    }
  }
}

#Configure AWS provider
provider "aws" {
  region = var.aws_region
}