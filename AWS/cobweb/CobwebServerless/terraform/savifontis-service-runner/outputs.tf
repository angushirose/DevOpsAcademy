output "lambda_arn" {
  value = "module.savifontis_service_lambda_function.arn[0]"
  description = "The lambda arn of the Savifontis Service Runner"
}

output "lambda_invoke_arn" {
  value = "module.savifontis_service_lambda_function.invoke_arn[0]"
}