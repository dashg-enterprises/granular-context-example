variable "application_image" {
  description = "Docker image to run in the ECS cluster"
}

variable "environment_name" {
  description = "Name of the deployment environment."
  type        = string
}

variable "vpc" {
    description = "The VPC for this bounded context"
    type = object({
        id = string
        private_subnet_ids = list(string)
        public_subnet_ids = list(string)
  })
}

variable "ecs_security_group_id" {
    description = "The SG id for this bounded context"
    type = string
}

variable "lb_security_group_id" {
    description = "The SG id for the load balancer"
    type = string
}

variable "snapshot_table_arn" {
  description = "ARN of the table for aggregate snapshots"
  type = string
}

variable "event_log_table_arn" {
  description = "ARN of the table for the aggregate event log"
  type = string
}

variable "materialized_views_table_arn" {
  description = "ARN of the table for materializing views over the domain"
  type = string
}

variable "event_bus_arn" {
  description = "ARN of the event bus for broadcasting events (unused, prefer event_topic_arn)"
  type = string
}

variable "event_topic_arn" {
  description = "ARN of the table for publishing events"
  type = string
}

variable "environment_variables" {
    description = "Environment variables to feed into the container environment"
    type = map(string)
}