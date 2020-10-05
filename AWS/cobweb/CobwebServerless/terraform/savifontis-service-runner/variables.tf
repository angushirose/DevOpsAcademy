variable "tag" {
  type = map(string)
}

variable "concurrent_executions" {}

variable "log_retention" {}

variable "xray_tracing_mode" {
  default = "Active"
}

variable "deployment_archive" {
  type = map(string)
}

variable "builder_boundary_name" {}

variable "version_number" {}

variable "infrastructure_prefix" {}