output "bucket_id" {
  description = "The ID of the created S3 bucket"
  value       = aws_s3_bucket.this.id
}

output "endpoint" {
  description = "The website endpoint URL of the S3 bucket"
  value       = aws_s3_bucket_website_configuration.this.website_endpoint
}
