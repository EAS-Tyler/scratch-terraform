provider "harness" {
  endpoint         = var.harness_platform_url
  account_id       = ephemeral.vault_kv_secret_v2.harness.data["account_id"]
  platform_api_key = ephemeral.vault_kv_secret_v2.harness.data["api_key"]
}

data "harness_platform_organization" "org" {
  name = var.organization_name
}

resource "harness_platform_project" "project" {
  identifier = var.project_name
  name       = var.project_name
  org_id     = data.harness_platform_organization.org.id

}

resource "harness_platform_pipeline" "demo" {
  org_id     = data.harness_platform_organization.org.id
  project_id = harness_platform_project.project.id

  identifier  = "demo_pipeline"
  name        = "Demo Pipeline"
  description = "A demo pipeline managed by Terraform."
  yaml        = templatefile("${path.module}/pipeline.tpl", {
    project_id = harness_platform_project.project.id
    org_id = data.harness_platform_organization.org.id
  })
}



resource "harness_platform_pipeline" "manual" {
  org_id      = data.harness_platform_organization.org.id
  project_id  = harness_platform_project.project.id
  identifier  = var.pipeline_identifier
  name        = var.pipeline_name
  # yaml        = templatefile("${path.module}/pipeline.tpl", {
  #   project_id = harness_platform_project.project.id
  #   org_id     = data.harness_platform_organization.org.id
  # })
}



import {
  to = harness_platform_pipeline.manual
  id = "${data.harness_platform_organization.org.id}/${harness_platform_project.project.id}/${var.pipeline_identifier}"
}








module "users" {
  source               = "./modules/users"
  user_email_addresses = var.user_email_addresses
  project_id           = harness_platform_project.project.id
  org_id               = data.harness_platform_organization.org.id
}

module "pipeline_viewers_user_group" {
  source               = "./modules/user_groups"
  project_id           = harness_platform_project.project.id
  org_id               = data.harness_platform_organization.org.id
  user_email_addresses = [var.user_email_addresses[1]]
  user_group_name      = "pipeline_viewers"
}

module "pipeline_administrators_user_group" {
  source               = "./modules/user_groups"
  project_id           = harness_platform_project.project.id
  org_id               = data.harness_platform_organization.org.id
  user_email_addresses = [var.user_email_addresses[2]]
  user_group_name      = "pipeline_administrators"
}

# module "pipeline_viewers_role_assignment" {
#   source               = "./modules/roles"
#   org_id               = data.harness_platform_organization.org.id
#   project_id           = harness_platform_project.project.id
# #   user_group_id        = module.pipeline_viewers_user_group.user_group_id
#   role_id              = "_pipeline_view"

# # add lifecycle blocks -- look into this more
# }

# module "pipeline_administrators_role_assignment" {
#   source               = "./modules/roles"
#   project_id           = harness_platform_project.project.id


