terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "jenkinsinstance-test" {
  ami                    = "ami-0230bd60aa48260c6"
  instance_type          = "t2.micro"
  key_name               = "jenkins-kp"
  vpc_security_group_ids = [aws_security_group.jenkinstest-sg.id]
  user_data              = file("install_jenkins.sh")
  tags = {
    Name = "HelloJenkins"
  }
}

resource "aws_security_group" "jenkinstest-sg" {
  name        = "jenkinstest-sg"
  description = "allow inbound traffic 22, 8080"
  vpc_id      = "vpc-0ec51f31ec9b16cf1"

  ingress {
    description = "ssh access p22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["216.47.59.69/32"]
  }

  ingress {
    description = "allow all traffic p 8080"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "jenkinsterra-sg"
  }
}

resource "aws_s3_bucket" "jenkinsbucket" {
  bucket = "my-tf-jenkins-bucket-grinny-ninny-9879"

  tags = {
    Name        = "Grin-bucket"
  }
}

#basic example of S3 bucket ACL policy private bucket
resource "aws_s3_bucket" "jenkinsbucketpolicy" {
  bucket = "my-tf-jenkins-bucket-grinny-ninny-9879"
}

resource "aws_s3_bucket_ownership_controls" "jenkinsbucketpolicyrule" {
  bucket = aws_s3_bucket.jenkinsbucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "jenkinsbucket-private" {
  depends_on = [aws_s3_bucket_ownership_controls.jenkinsbucketpolicyrule]
  bucket     = aws_s3_bucket.jenkinsbucket.id
  acl        = "private"
}
