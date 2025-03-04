locals { // get these as imports to construct DDD API
  aggregate_root_name  = "Granule"
  bounded_context_name = "GranuleContext"
  application_name     = "GranuleService"
  application_image    = var.application_image
  environment_variables = var.environment_variables
  vpc = var.vpc
  security_group_id = var.security_group_id
}

module "fargate_bounded_context" {
  source = "git::https://github.com/dashg-enterprises/cloud-platform.git//modules/bounded-context-granules/aws/cluster?ref=main"
  aggregate_root_name = local.aggregate_root_name
  bounded_context_name = local.bounded_context_name
  application_name = "${local.application_name}-${var.environment_name}"
  application_image = local.application_image
  vpc = local.vpc
  security_group_id = local.security_group_id
  load_balancer_target_id = module.fargate_bounded_context_lb.target_group_id
}

module "fargate_bounded_context_lb" {
  source = "git::https://github.com/dashg-enterprises/cloud-platform.git//modules/bounded-context-granules/aws/cluster?ref=main"
  application_name = "${local.application_name}-${var.environment_name}"
  vpc = local.vpc
}