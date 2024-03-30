output "rds_security_group_id" {
  value = aws_security_group.rds_security_group.id
}

output "alb_security_group_id" {
  value = aws_security_group.alb.id
}

output "ecs_service_security_group_id" {
  value = aws_security_group.ecs_service.id
}