variable "vpc_name" {}

variable "region" {}

variable "tags" {
  type = object({
    ConfigManagement = string
    Owner            = string
    Site             = string
    Billing          = string
    Environment      = string
  })
}

variable "vpc_cidr" {
  type = string
}
