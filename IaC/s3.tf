#S3 bucket
resource "aws_s3_bucket" "website-bucket" {
  bucket = var.bucket_name
  
  tags = {
    Name = "Cloud Resume Challenge"
  }
}

#The Oac Policy Document
data "aws_iam_policy_document" "website-bucket-policy-document" {
  statement {
    principals {
      identifiers = ["cloudfront.amazonaws.com"]
      type = "Service"
    }
    actions = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.website-bucket.arn}/*"]

    condition {
      test = "StringEquals"
      values = [aws_cloudfront_distribution.website-distribution.arn]
      variable = "AWS:SourceArn"
    }
  }
}

#S3 bucket policy
resource "aws_s3_bucket_policy" "website-bucket-policy" {
  bucket = aws_s3_bucket.website-bucket.id
  policy = data.aws_iam_policy_document.website-bucket-policy-document.json
}

#Bucket ownership for s3 cicd
resource "aws_s3_bucket_ownership_controls" "cloud-resume-challenge-bucket-ownership-controls" {
  bucket = aws_s3_bucket.website-bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

#Public bucket access enabling
resource "aws_s3_bucket_public_access_block" "cloud-resume-challenge-public-access-block" {
  bucket = aws_s3_bucket.website-bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

#ACL declaration
resource "aws_s3_bucket_acl" "bucket-acl" {
  depends_on = [
    aws_s3_bucket_ownership_controls.cloud-resume-challenge-bucket-ownership-controls,
    aws_s3_bucket_public_access_block.cloud-resume-challenge-public-access-block,
  ]

  bucket = aws_s3_bucket.website-bucket.id
  acl    = "public-read"
}