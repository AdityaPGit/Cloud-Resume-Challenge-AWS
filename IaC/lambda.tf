#Lambda Python file
data "archive_file" "counter-lambda-file" {
  type        = "zip"
  source_file = "lambda/lambda_function.py"
  output_path = "lambda/lambda_function_payload.zip"
}

#Lambda Function
resource "aws_lambda_function" "counter-lambda-function" {
  filename      = "lambda/lambda_function_payload.zip"
  function_name = "counter-handler"
  role          = aws_iam_role.IAM-role-lambda-function.arn
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.9"
  tags = {
    Identifier = "Cloud Resume Challenge"
  }
}

#IAM policy which will be attached to the lambda's role
data "aws_iam_policy_document" "lambda-role-for-crc" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

#IAM policy for dynamodb and lambda function
resource "aws_iam_policy" "lambda_dynamodb_logging_policy" {
  name = "LambdaDynamoDBPolicy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "dynamodb:GetItem",
          "dynamodb:PutItem",
          "dynamodb:UpdateItem"
        ]
        Resource = "${aws_dynamodb_table.count-dynamodb-table.arn}"
      },
      {
        Effect = "Allow"
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Resource = "arn:aws:logs:*:*:*"
      }
    ]
  })
}

#Resource for attaching dynamodb and logging policy to lambda
resource "aws_iam_role_policy_attachment" "lambda_dynamodb_policy_attachment" {
  role       = aws_iam_role.IAM-role-lambda-function.name
  policy_arn = aws_iam_policy.lambda_dynamodb_logging_policy.arn
}

#IAM for the lambda funtionn
resource "aws_iam_role" "IAM-role-lambda-function" {
  name               = "cloud-resume-challenge-role"
  assume_role_policy = data.aws_iam_policy_document.lambda-role-for-crc.json
  tags = {
    Identifier = "Cloud Resume Challenge"
  }
}
