resource "aws_s3_bucket" "treat-bucket" {
  bucket = var.bucket

  tags = {
    Name = var.name
  }
}

resource "aws_s3_bucket_versioning" "store-versions" {
  bucket = var.bucket
  versioning_configuration {
    status = "Enabled"
  }
}