resource "aws_api_gateway_rest_api" "savifontis_api" {
  name        = var.name
  description = var.description
}

resource "aws_api_gateway_method" "request_method" {
  rest_api_id = aws_api_gateway_rest_api.savifontis_api.id
  resource_id = aws_api_gateway_rest_api.savifontis_api.root_resource_id
  http_method = var.method
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "request_integration" {
  http_method = aws_api_gateway_method.request_method.id
  resource_id = aws_api_gateway_method.request_method.resource_id
  rest_api_id = aws_api_gateway_rest_api.savifontis_api.id
  type = "AWS_PROXY"
  uri = var.lambda_invoke_arn
  integration_http_method = "POST"
}

resource "aws_api_gateway_stage" "stage" {
  stage_name = var.stage
}