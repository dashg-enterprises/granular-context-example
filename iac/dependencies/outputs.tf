output "command_queue_arn" {
  value = module.granular_bounded_context_dependencies.command_queue_arn
}

output "delayed_command_queue_arn" {
  value = module.granular_bounded_context_dependencies.delayed_command_queue_arn
}

output "command_dlq_arn" {
  value = module.granular_bounded_context_dependencies.command_dlq_arn
}

output "event_bus_name" {
  value = module.granular_bounded_context_dependencies.event_bus_name
}

output "event_topic_arn" {
  value = module.granular_bounded_context_dependencies.event_topic_arn
}

output "event_log_table_name" {
  value = module.granular_bounded_context_dependencies.event_log_table_name
}

output "snapshot_table_name" {
  value = module.granular_bounded_context_dependencies.snapshot_table_name
}

output "materialized_views_table_name" {
  value = module.granular_bounded_context_dependencies.materialized_views_table_name
}

output "ecs_security_group_id" {
  value = module.granular_bounded_context_security.ecs_security_group_id
}

output "lb_security_group_id" {
  value = module.granular_bounded_context_security.lb_security_group_id
}