output "rds_arn" {
  value = module.granular_bounded_context_sql_db.rds_arn
}

output "rds_address" {
  value = module.granular_bounded_context_sql_db.rds_address
}

output "rds_port" {
  value = module.granular_bounded_context_sql_db.rds_port
}

output "rds_username" {
  value = module.granular_bounded_context_sql_db.rds_username
}

output "rds_password" {
  value = module.granular_bounded_context_sql_db.rds_password
  sensitive = true
}

output "rds_cert_id" {
  value = module.granular_bounded_context_sql_db.rds_cert_id
}

output "rds_cert_pem" {
  value = module.granular_bounded_context_sql_db.rds_cert_pem
}

output "rds_replica_connection_parameters" {
  value = module.granular_bounded_context_sql_db.rds_replica_connection_parameters
}
