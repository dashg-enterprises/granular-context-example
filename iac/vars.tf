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

variable "security_group_id" {
    description = "The SG id for this bounded context"
    type = string
}

variable "environment_variables" {
    description = "Environment variables to feed into the container environment"
    type = map(string)
}