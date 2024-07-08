output "bucket_id" {
  value = aws_s3_bucket.this.id
}

output "endpoint" {
  value = aws_s3_bucket_website_configuration.this.website_endpoint
}
