variable "hostname" {
  description = "TFE hostname or app.terraform.io"
  default = "app.terraform.io"
}

variable "token" {
  default = "jlinn@hashicorp.com"
  description = "TFE hostname or app.terraform.io"
}

variable "org-name" {
  description = "Name of org to create"
  default = "HashiCups-Demo-Org"
}
variable "org-email" {
  description = "TFE hostname or app.terraform.io"
}
