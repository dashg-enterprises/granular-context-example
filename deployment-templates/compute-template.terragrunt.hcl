include "root" {
  path = find_in_parent_folders()
}

locals {
  application_image = ""
  repo_path = ""
  repo_name = ""
  environment_name = ""
}

terraform {
  source = "git::https://github.com/${local.repo_path}.git//iac/compute?ref=main"
}

dependency "cloudscape" {
  config_path = "../../../cloudscape"
}

dependency "dependencies" {
  config_path = "../dependencies"
}

dependency "sql_db" {
  config_path = "../sql-db"
}

dependency "initialization" {
  config_path = "../../../../_initializations/${local.repo_name}"
}

inputs = {
  application_image = local.application_image
  environment_name  = local.environment_name
  vpc = {
    id                 = dependency.cloudscape.outputs.vpc_id
    private_subnet_ids = dependency.cloudscape.outputs.private_subnet_ids
    public_subnet_ids  = dependency.cloudscape.outputs.public_subnet_ids
  }
  security_group_id = dependency.dependencies.outputs.ecs_security_group_id
  environment_variables = {
    COMMAND_QUEUE_ARN = dependency.dependencies.outputs.command_queue_arn
    DELAYED_COMMAND_QUEUE_ARN = dependency.dependencies.outputs.delayed_command_queue_arn
    EVENT_LOG_TABLE_NAME = dependency.dependencies.outputs.event_log_table_name
    SNAPSHOT_TABLE_NAME = dependency.dependencies.outputs.snapshot_table_name
    MATERIALIZED_VIEWS_TABLE_NAME = dependency.dependencies.outputs.materialized_views_table_name
    EVENT_TOPIC_ARN = dependency.dependencies.outputs.event_topic_arn
    EVENT_BUS_NAME = dependency.dependencies.outputs.event_bus_name
    DB_USERNAME = dependency.sql_db.outputs.rds_username
    DB_PASSWORD = dependency.sql_db.outputs.rds_password
    DB_HOST = dependency.sql_db.outputs.rds_address
    DB_CERT = dependency.sql_db.outputs.rds_cert_pem
  }
}