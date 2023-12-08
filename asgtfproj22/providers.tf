terraform {
  backend "s3" {
    bucket = "woofers-treat-bucket-2023"
    key    = "backend/state"
    region = "us-east-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.29.0"
    }
    http = {
      source  = "hashicorp/http"
      version = "3.4.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}



