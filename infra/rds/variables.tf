variable "name" {
  description = "Name of the application"
  type        = string
}

variable "environment" {
  description = "Deployment environment (e.g., dev, staging, prod)"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC where the RDS instance will be deployed"
  type        = string
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs where the RDS instance will be deployed"
  type        = list(string)
}

variable "rds_security_group_id" {
  type = string
}

variable "engine" {
  description = "Database engine (e.g., mysql, postgres)"
  type        = string
  default     = "mysql"
}

variable "engine_version" {
  description = "Database engine version"
  type        = string
  default     = "8.0.35"
}

variable "instance_class" {
  description = "Instance type for the RDS instance"
  type        = string
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  description = "Amount of storage to allocate for the RDS instance (in GB)"
  type        = number
  default     = 20
}

variable "storage_type" {
  description = "Storage type (e.g., gp2, io1)"
  type        = string
  default     = "gp2"
}

variable "multi_az" {
  description = "Whether to enable multi-AZ deployment"
  type        = bool
  default     = false
}

variable "db_name" {
  description = "Name of the database"
  type        = string
  default     = "myapp"
}

variable "username" {
  description = "Database username"
  type        = string
  default     = "admin"
}

variable "password" {
  description = "RDS password retrieved from Secrets Manager"
  type        = string
  sensitive   = true
}

variable "backup_retention_period" {
  description = "Number of days to retain backups"
  type        = number
  default     = 7
}