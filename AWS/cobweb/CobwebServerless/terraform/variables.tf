variable "image_id" {
  type = number
  default = 23
}

variable "port_list" {
  type = list(number)
  default = [8080, 8081]
}

variable "docker_images" {
  type = list(object({
    dev = string
    non-prod = string
    prod = string
  }))
  default = [
    {
      dev = "dev_image"
      non-prod = "non_prod_image"
      prod = "prod_image"
    }
  ]
}