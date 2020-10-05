module "api-gateway" {
  source = "./api-gateway"
  stage = "Dev"
  name = "${local.infrastructure_prefix}-API"
  lambda_arn = module.savifontis_service_runner.lambda_arn
  lambda_invoke_arn = module.savifontis_service_runner.lambda_invoke_arn
  infrastructure_prefix = local.infrastructure_prefix
}