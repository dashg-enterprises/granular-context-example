locals { // get these as imports to construct DDD API
  aggregate_root_name  = "Granule"
  bounded_context_name = "GranuleContext"
  application_name     = "GranuleService"
}

module "granular_bounded_context_dependencies" {
  source = "git::https://github.com/dashg-enterprises/cloud-platform.git//modules/bounded-context-granules/aws/dependencies?ref=main"
  aggregate_root_name = local.aggregate_root_name
  bounded_context_name = local.bounded_context_name
  application_name = "${local.application_name}-${var.environment_name}"
}