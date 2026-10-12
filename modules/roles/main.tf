#  cannot create roles, need enterprise plan

resource "harness_platform_user_group_role_assignment" "role_assignment" {
  org_id        = var.org_id
  project_id    = var.project_id
  user_group_id = var.user_group_id
  role_ids      = [var.role_id]
}