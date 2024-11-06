resource "aws_apigatewayv2_api" "counter-api" {
  name          = "LiveCountApiGateway"
  description = "API Gateway endpoint for the live cloud resumme challenge counter"
  protocol_type = "HTTP"
  cors_configuration {
    allow_origins = ["*"]
    allow_credentials = false
    allow_headers = ["*"]
    allow_methods = ["*"]
    expose_headers = ["*"]
    max_age = 10
  }
  tags = {
    Identifier = "Cloud Resume Challenge"
  }
}

resource "aws_apigatewayv2_route" "counter-api-route" {
  api_id    = aws_apigatewayv2_api.counter-api.id
  route_key = "$default"
  target = "integrations/${aws_apigatewayv2_integration.counter-api-integration.id}"
}

resource "aws_apigatewayv2_integration" "counter-api-integration" {
  api_id           = aws_apigatewayv2_api.counter-api.id
  integration_type = "AWS_PROXY"
  description               = "Integration to hit the lambda function, increment in the dynamodb table, and fetch the incremented item back"
  integration_method        = "POST"
  integration_uri           = aws_lambda_function.counter-lambda-function.invoke_arn
  passthrough_behavior      = "WHEN_NO_MATCH"
}

resource "aws_apigatewayv2_stage" "counter-api-deployment-stage" {
  api_id = aws_apigatewayv2_api.counter-api.id
  name = "count"
  auto_deploy = true
}
