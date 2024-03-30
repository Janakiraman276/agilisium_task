output "db_pass" {
  value = jsondecode(data.aws_secretsmanager_secret_version.db_pass.secret_string)["password"]
  sensitive = true
}