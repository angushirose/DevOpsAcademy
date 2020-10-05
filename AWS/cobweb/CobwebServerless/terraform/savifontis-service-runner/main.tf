locals {
  function_name_suffix = "Runner-Service"
  function_name = "${var.infrastructure_prefix}-${local.function_name_suffix}"
}

module savifontis_service_lambda_function {

  source = "git::https://github.com/angushirose/tf-lambda.git?ref=1.0.4"
  create = true
  function_name = local.function_name
  handler       = "uk.co.savifontis.cobweb.CobwebGatewayHandler"
  deployment_archive = var.deployment_archive
  description   = "Savifontis Service Runner"
  runtime       = "java8"

  timeout       = 30
  memory   = 512
  role = aws_iam_role.iam_for_lambda.arn

  concurrent_executions = var.concurrent_executions
  log_retention = var.log_retention

  tags = var.tags

  role_description = var.role_description

  permissions_policy = <<EOF
  {
      "Version": "2012-10-17",
      "Statement": [
          {
              "Sid": "CloudwatchAccess",
              "Effect": "Allow",
              "Action": [
                "logs:PutLogEvents",
                "logs:CreateLogStream",
                "logs:CreateLogGroup"
              ],
              "Resource": "arn:aws:logs:*:*:*"
          },
          {
              "Sid": "IAMAccess",
              "Effect": "Allow",
              "Action": [
                  "iam:PassRole"
              ],
              "Resource": "*"
          }
  ]
  }
  EOF
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
resource "aws_cloudwatch_log_group" "dev_cloudwatch" {
  name              = "/aws/lambda/${module.savifontis_service_lambda_function.function_name}"
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
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = aws_iam_policy.lambda_logging.arn
}








