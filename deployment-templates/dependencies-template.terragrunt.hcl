include "root" {
  path = find_in_parent_folders()
}

locals {
  repo_path = ""
  repo_name = ""
  environment_name = ""
}

terraform {
  source = "git::https://github.com/${local.repo_path}.git//iac/dependencies?ref=main"
}

dependency "cloudscape" {
  config_path = "../../../cloudscape"
}

inputs = {
  environment_name  = local.environment_name
  vpc = {
    id                 = dependency.cloudscape.outputs.vpc_id
    private_subnet_ids = dependency.cloudscape.outputs.private_subnet_ids
    public_subnet_ids  = dependency.cloudscape.outputs.public_subnet_ids
  }
}