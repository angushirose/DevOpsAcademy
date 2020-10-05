variable "name" {
  default = "Savifontis Entry Point"
}

variable "description" {
  default = "This is an API for demonstration purposes. Trying new folder structure"
}

variable "method" {
  default = "POST"
}

variable "lambda_invoke_arn" {
  description = "The lambda invoke URI"
}

variable "stage" {
  description = "The stage name for the API deployment"
}

variable "infrastructure_prefix" {}

variable "lambda_arn" {
  description = "The lambda arn"
}