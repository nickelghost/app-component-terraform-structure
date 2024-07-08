locals {
  index_path = "${path.module}/index.html"
}

module "static_website" {
  source = "../../components/static_website"

  name = "green-website"
}

resource "aws_s3_object" "index" {
  bucket       = module.static_website.bucket_id
  key          = "index.html"
  source       = local.index_path
  etag         = filemd5(local.index_path)
  content_type = "text/html"
}
