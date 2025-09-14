locals { // get these as imports to construct DDD API
  aggregate_root_name  = "Granule"
  bounded_context_name = "GranuleContext"
  application_name     = "GranuleService"
  application_image    = var.application_image
  environment_variables = var.environment_variables
  vpc = var.vpc
  ecs_security_group_id = var.ecs_security_group_id
  lb_security_group_id = var.ecs_security_group_id
  snapshot_table_arn = var.snapshot_table_arn
  event_log_table_arn = var.event_log_table_arn
  materialized_views_table_arn = var.materialized_views_table_arn
  event_bus_arn = var.event_bus_arn
  event_topic_arn = var.event_topic_arn
}

module "fargate_bounded_context" {
  source = "git::https://github.com/dashg-enterprises/cloud-platform.git//modules/bounded-context-granules/aws/cluster?ref=main"
  aggregate_root_name = local.aggregate_root_name
  bounded_context_name = local.bounded_context_name
  application_name = "${local.application_name}-${var.environment_name}"
  application_image = local.application_image
  vpc = local.vpc
  security_group_id = local.ecs_security_group_id
  load_balancer_target_id = module.fargate_bounded_context_lb.lb_target_group_id
  snapshot_table_arn =local.snapshot_table_arn
  event_log_table_arn = local.event_log_table_arn
  materialized_views_table_arn = local.materialized_views_table_arn
  event_bus_arn = local.event_bus_arn
  event_topic_arn = local.event_topic_arn
  environment_variables = local.environment_variables
}

module "fargate_bounded_context_lb" {
  source = "git::https://github.com/dashg-enterprises/cloud-platform.git//modules/bounded-context-granules/aws/load_balancer?ref=main"
  application_name = "${local.application_name}-${var.environment_name}"
  vpc = local.vpc
  security_group_id = local.lb_security_group_id
}