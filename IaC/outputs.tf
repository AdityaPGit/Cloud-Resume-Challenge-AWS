output "cloudfront-url" {
  value = "https://${aws_cloudfront_distribution.website-distribution.domain_name}"
  description = "URL for cloudfront distribution"
}
output "apigateway-url" {
  value = aws_apigatewayv2_stage.counter-api-deployment-stage.invoke_url
  description = "URL for the apigateway associated"
}