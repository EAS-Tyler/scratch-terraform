variable "harness_platform_url" {
  type    = string
  default = "https://app.harness.io/gateway"
}

# variable "harness_platform_account" {
#   type    = string
#   default = "default"
# }

# variable "harness_platform_key" {
#   type      = string
#   default   = "default"
#   sensitive = true
# }

variable "organization_name" {
  type    = string
  default = "default"
}

variable "project_name" {
  type    = string
  default = "default"
}

variable "user_email_addresses" {
  type    = list(string)
  default = []
}

variable "pipeline_identifier" {
  type    = string
  default = "moveme"
}

variable "pipeline_identifier2" {
  type = string
  # default = "moveme2"
}

variable "pipeline_name" {
  type    = string
  default = "move_me"
}

variable "pipeline_name2" {
  type = string
  # default = "move_me_2"
}