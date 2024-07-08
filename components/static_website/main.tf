resource "random_id" "this" {
  byte_length = 4
}

resource "aws_s3_bucket" "this" {
  bucket        = "${var.name}-${random_id.this.hex}"
  force_destroy = true
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

data "aws_iam_policy_document" "s3_public_access" {
  statement {
    principals {
      type        = "*"
      identifiers = ["*"]
    }

    effect    = "Allow"
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.this.arn}/*"]
  }
}

resource "aws_s3_bucket_policy" "public_access" {
  bucket = aws_s3_bucket_public_access_block.this.bucket
  policy = data.aws_iam_policy_document.s3_public_access.json
}

resource "aws_s3_bucket_website_configuration" "this" {
  bucket = aws_s3_bucket.this.id

  index_document {
    suffix = "index.html"
  }
}
