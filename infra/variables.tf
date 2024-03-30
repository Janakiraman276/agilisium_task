variable "aws_region" {
  description = "AWS region to create resources in"
  default     = "ap-south-1"
}

variable "app_name" {
  description = "Name of the application"
  default     = "my-app"
}

variable "environment" {
  description = "Deployment environment (e.g., dev, staging, prod)"
  default     = "dev"
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets"
  default     = ["10.0.4.0/24", "10.0.5.0/24"]
}

variable "availability_zones" {
  description = "Availability zones to create subnets in"
  default     = ["ap-south-1a", "ap-south-1b"]
}

variable "container_port" {
  description = "Port exposed by the application container"
  default     = 8080
}

variable "db_engine" {
  description = "Database engine (e.g., mysql, postgres)"
  default     = "mysql"
}

variable "db_engine_version" {
  description = "Database engine version"
  default     = "8.0.35"
}

variable "db_instance_class" {
  description = "Instance type for the RDS instance"
  default     = "db.t3.micro"
}

variable "db_allocated_storage" {
  description = "Amount of storage to allocate for the RDS instance (in GB)"
  default     = 20
}

variable "db_name" {
  description = "Name of the database"
  default     = "myapp"
}

variable "db_username" {
  description = "Database username"
  default     = "admin"
}

variable "container_cpu" {
  description = "CPU units for the container"
  default     = 256
}

variable "container_memory" {
  description = "Memory for the container (in MiB)"
  default     = 512
}

variable "container_environment" {
  description = "Environment variables for the container"
  default     = []
}


variable "service_desired_count" {
  description = "Desired count for the ECS service"
  default     = 2
}

