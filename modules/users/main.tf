
resource "harness_platform_user" "users" {
  for_each    = toset(var.user_email_addresses)
  email       = each.value
  org_id      = var.org_id
  project_id  = var.project_id
  user_groups = []
}