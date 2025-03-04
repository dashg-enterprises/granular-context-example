output "lb_arn" {
  value = module.fargate_bounded_context_lb.lb_arn
}

output "lb_dns_name" {
  value = module.fargate_bounded_context_lb.lb_dns_name
}

output "security_group_id" {
  value = module.fargate_bounded_context.security_group_id
}