locals {  # need to get this from same place as bounded-context
  bounded_context_name = "GranuleContext"
}

module "granular_bounded_context_sql_db" {
  source = "git::https://github.com/dashg-enterprises/cloud-platform.git//modules/sql-database/aws?ref=main"
  database_name = "${local.bounded_context_name}Db"
  vpc = var.vpc
  application_security_groups = [var.application_security_group_id]
}