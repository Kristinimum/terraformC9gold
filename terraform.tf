terraform {
  backend "s3" {
    bucket = "kristinimumsbucket64tform"
    key    = "prod/aws_infra"
    region = "us-east-1"

    # Replace this with your DynamoDB table name!
    dynamodb_table = "tform-locks"
    encrypt        = true
  }

  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0"
    }
    http = {
      source  = "hashicorp/http"
      version = "2.1.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.1.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "3.1.0"
    }
  }
}

