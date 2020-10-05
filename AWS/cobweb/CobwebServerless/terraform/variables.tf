variable infrastructure_prefix {
  default = "Savifontis"
}
variable "aws_region" {
  default = "eu-west-1"
}

variable "aws_profile" {
  default = "PilgrimDev"
}

variable "tags"{
  type = map(string)
}

variable "concurrent_executions" {
  default = "25"
}

variable "team_role" {}

variable "version_number" {}

variable "log_retention" {
  default = "7"
}


variable "xray_tracing_mode" {
  default = "Active"
}

variable "deployment_archive" {
  type = map(string)
}

variable "builder_boundary_name" {}