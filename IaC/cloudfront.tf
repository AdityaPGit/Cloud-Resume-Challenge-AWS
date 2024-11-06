#Cloudfront Distribution
resource "aws_cloudfront_distribution" "website-distribution" {
  comment = "Cloudfront Distribution for Cloud Resume Challenge"
  origin {
    domain_name              = aws_s3_bucket.website-bucket.bucket_domain_name
    origin_access_control_id = aws_cloudfront_origin_access_control.aws-oac-cloudfront-crc.id
    origin_id                = aws_s3_bucket.website-bucket.id
  }

  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = "index.html"

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    cache_policy_id = "658327ea-f89d-4fab-a63d-7e88639e58f6"
    target_origin_id = aws_s3_bucket.website-bucket.id
    viewer_protocol_policy = "https-only"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  tags = {
    Name = "Cloudfront distribution for Cloud Resume Challenge"
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}

#Cloudfront OAC for s3 bucket
resource "aws_cloudfront_origin_access_control" "aws-oac-cloudfront-crc" {
  name                              = var.oac_name
  description                       = "OAC for Cloud Resume Challenge"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

