

resource "harness_platform_pipeline" "manual2" {
  org_id      = data.harness_platform_organization.org.id
  project_id  = harness_platform_project.project.id
  identifier  = var.pipeline_identifier2
  name        = var.pipeline_name2
}

# import {
#   to = harness_platform_pipeline.manual2
#   id = "${data.harness_platform_organization.org.id}/${harness_platform_project.project.id}/${var.pipeline_identifier2}"
# }