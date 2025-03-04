include "root" {
  path = find_in_parent_folders()
}

locals {
  repo_path = ""
  repo_name = ""
  environment_name = ""
}

terraform {
  source = "git::https://github.com/${local.repo_path}.git//iac/sql-db?ref=main"
}

dependency "cloudscape" {
  config_path = "../../cloudscape"
}

dependency "dependencies" {
  config_path = "../dependencies"
}

inputs = {
  application_image = local.application_image
  environment_name  = local.environment_name
  application_security_group_id = dependency.dependencies.outputs.ecs_security_group_id
  vpc = {
    id                 = dependency.cloudscape.outputs.vpc_id
    private_subnet_ids = dependency.cloudscape.outputs.private_subnet_ids
    public_subnet_ids  = dependency.cloudscape.outputs.public_subnet_ids
  }
}