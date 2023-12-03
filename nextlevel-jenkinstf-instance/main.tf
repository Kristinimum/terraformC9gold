resource "aws_instance" "jenkinsinstance" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.jenkinstest-sg.id]
  user_data              = file("install_jenkins.sh")
  tags = {
    Name = "HelloJenkins"
  }
}

resource "aws_security_group" "jenkinstest-sg" {
  name        = "jenkinstest-sg"
  description = "allow inbound traffic 22, 8080"

  ingress {
    description = "ssh access p22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
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
  bucket = var.bucket

  tags = {
    Name = "Grin-bucket"
  }
}
#basic example of S3 bucket ACL policy private bucket
resource "aws_s3_bucket" "jenkinsbucketpolicy" {
  bucket = var.bucket
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
  acl        = var.acl
}