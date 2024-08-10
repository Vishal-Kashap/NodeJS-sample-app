# s3/main.tf

resource "aws_s3_bucket" "bucket" {
  bucket = var.s3_bucket_name

  tags = var.s3_bucket_tags
}

output "s3_bucket_id" {
  value = aws_s3_bucket.bucket.id
}
