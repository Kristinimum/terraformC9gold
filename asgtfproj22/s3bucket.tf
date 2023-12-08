resource "aws_s3_bucket" "treat_bucket" {
    bucket = var.bucket
    
    tags = {
      Name = var.name
      }
}

resource "aws_s3_bucket_versioning" "store_versions" {
    bucket = aws_s3_bucket.treat_bucket.id
    versioning_configuration {
        status = "Enabled"
    }
}