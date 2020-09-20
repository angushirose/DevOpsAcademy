variable "aws_region" {
  default = "eu-west-1"
}

provider "aws" {
  region = "eu-west-1"
}

resource "aws_lambda_function" "cobweb_lambda" {
  function_name = "savifontis_cobweb_lambda"
  handler       = "uk.co.savifontis.cobweb.CobwebGatewayHandler"
  runtime       = "java8"
  filename      = "../target/Cobweb-1.0.jar"
  timeout       = 60
  memory_size   = 256
  role = aws_iam_role.iam_for_lambda.arn

}

resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": [
          "lambda.amazonaws.com"
        ]
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}
resource "aws_cloudwatch_log_group" "example" {
  name              = "/aws/lambda/${aws_lambda_function.cobweb_lambda.function_name}"
  retention_in_days = 14
}

resource "aws_iam_policy" "lambda_logging" {
  name        = "lambda_logging"
  path        = "/"
  description = "IAM policy for logging from a lambda"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "arn:aws:logs:*:*:*",
      "Effect": "Allow"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "lambda_logs" {
  role       = "${aws_iam_role.iam_for_lambda.name}"
  policy_arn = "${aws_iam_policy.lambda_logging.arn}"
}

resource "aws_api_gateway_rest_api" "CobwebGatewayAPI" {
  name        = "CobwebGatewayAPI"
  description = "This is my API for demonstration purposes"
}






