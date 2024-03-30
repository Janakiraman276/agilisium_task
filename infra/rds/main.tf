

resource "aws_db_instance" "main" {
  identifier              = "${var.name}-rds-${var.environment}"
  engine                  = var.engine
  engine_version          = var.engine_version
  instance_class          = var.instance_class
  allocated_storage       = var.allocated_storage
  storage_type            = var.storage_type
  multi_az                = var.multi_az
  db_name                 = var.db_name
  username                = var.username
  password                = jsondecode(data.aws_secretsmanager_secret_version.db_pass.secret_string)["password"]
  db_subnet_group_name    = aws_db_subnet_group.main.name
  vpc_security_group_ids  = [var.rds_security_group_id]
  backup_retention_period = var.backup_retention_period
  skip_final_snapshot     = true

  tags = {
    Name        = "${var.name}-rds-${var.environment}"
    Environment = var.environment
  }
}

# Create the RDS subnet group
resource "aws_db_subnet_group" "main" {
  name       = "${var.name}-rds-subnet-group-${var.environment}"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name        = "${var.name}-rds-subnet-group-${var.environment}"
    Environment = var.environment
  }
}


data "aws_secretsmanager_secret_version" "db_pass" {
  secret_id = "arn:aws:secretsmanager:ap-south-1:645406807036:secret:db_pass-hTPyDb"
}

