variable "name" {
  description = "Name of the application"
  type        = string
}

variable "environment" {
  description = "Environment (e.g. dev, staging, prod)"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
}

variable "container_cpu" {
  description = "CPU units for the ECS container"
  type        = number
}

variable "container_memory" {
  description = "Memory for the ECS container (in MiB)"
  type        = number
}

variable "container_image" {
  description = "Docker image for the ECS container"
  type        = string
}

variable "container_port" {
  description = "Port on which the container is listening"
  type        = number
}

variable "container_environment" {
  description = "Environment variables for the container"
  type        = list(object({
    name  = string
    value = string
  }))
  default     = []
}

variable "service_desired_count" {
  description = "Desired count of tasks for the ECS service"
  type        = number
}

variable "ecs_service_security_groups" {
  description = "Security groups for the ECS service"
  type        = list(string)
}

variable "subnets" {
  description = "List of subnet IDs"
}


variable "aws_alb_target_group_arn" {
  description = "ARN of the Application Load Balancer target group"
  type        = string
}