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

inputs = {
  environment_name  = local.environment_name
}