locals {
  application_name     = "GranuleService"
}

module "granular_bounded_context_sql_db" {
  source = "git::https://github.com/dashg-enterprises/cloud-platform.git//modules/sql-database/aws?ref=main"
  database_name = "${var.bounded_context_name}Db"
  vpc = var.vpc
  application_security_groups = [var.application_security_group_id]
}