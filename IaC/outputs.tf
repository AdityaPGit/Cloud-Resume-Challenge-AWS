output "cloudfront-url" {
  value = "https://${aws_cloudfront_distribution.website-distribution.domain_name}"
  description = "URL for cloudfront distribution"
}