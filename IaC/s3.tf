#S3 bucket
resource "aws_s3_bucket" "website-bucket" {
  bucket = var.bucket_name

  tags = {
    Name = "Cloud Resume Challenge"
  }
}

#Bucket Ownership Resource
resource "aws_s3_bucket_ownership_controls" "website-bucket-ownership-control" {
  bucket = aws_s3_bucket.website-bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

#Bucket ACL
resource "aws_s3_bucket_acl" "website-bucket-acl" {
  depends_on = [aws_s3_bucket_ownership_controls.website-bucket-ownership-control]

  bucket = aws_s3_bucket.website-bucket.id
  acl    = "private"
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
