variable "user_email_addresses" {
  type    = list(string)
  default = []

  validation {
    condition     = length(var.user_email_addresses) > 0 // &&
    error_message = "user_email_addresses must be a list of strings"
  }
}

variable "project_id" {
  type    = string
  default = ""
}

variable "org_id" {
  type    = string
  default = ""
}
