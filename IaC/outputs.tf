output "cloudfront-url" {
  value = "https://${aws_cloudfront_distribution.website-distribution.domain_name}"
  description = "URL for cloudfront distribution"
}
output "api-url" {
  value = aws_apigatewayv2_stage.counter-api-deployment-stage.invoke_url
  description = "API url for the counter"
}