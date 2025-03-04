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

variable "application_security_group_id" {
    description = "The application using this db`"
    type = list(string)
}