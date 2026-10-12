variable "role_id" {
  type    = string
  default = ""
}

variable "user_group_id" {
  type    = string
  default = ""
}

variable "org_id" {
  type    = string
  default = ""
}

variable "project_id" {
  type    = string
  default = ""
}

locals {
  role_id = "_pipeline_view"
}