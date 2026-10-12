resource "harness_platform_usergroup" "user_groups" {
  identifier  = var.user_group_name
  name        = var.user_group_name
  org_id      = var.org_id
  project_id  = var.project_id
  user_emails = var.user_email_addresses
}

