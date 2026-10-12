variable "user_group_name" {
  type    = string
  default = "scratch_user_group"
}

variable "org_id" {
  type    = string
  default = ""
}

variable "project_id" {
  type    = string
  default = ""
}

variable "user_email_addresses" {
  type    = list(string)
  default = []
}