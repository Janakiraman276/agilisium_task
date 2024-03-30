terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.37.0"
    }
  }
}

provider "aws" {
}


# VPC Module
module "vpc" {
  source             = "./vpc"
  name               = var.app_name
  cidr               = var.vpc_cidr_block
  private_subnets    = var.private_subnet_cidrs
  public_subnets     = var.public_subnet_cidrs
  availability_zones = var.availability_zones
  environment        = var.environment
}

# Security Groups Module
module "security_groups" {
  source        = "./security-groups"
  name          = var.app_name
  environment   = var.environment
  vpc_id        = module.vpc.vpc_id
  container_port = var.container_port
}

# RDS Module
module "rds" {
  source                  = "./rds"
  name                    = var.app_name
  environment             = var.environment
  vpc_id                  = module.vpc.vpc_id
  private_subnet_ids      = module.vpc.private_subnet_ids
  rds_security_group_id   = module.security_groups.rds_security_group_id 
  engine                  = var.db_engine
  engine_version          = var.db_engine_version
  instance_class          = var.db_instance_class
  allocated_storage       = var.db_allocated_storage
  db_name                 = var.db_name
  username                = var.db_username
  password                = module.secrets.db_pass
}

# ALB Module
module "alb" {
  source                    = "./alb"
  name                      = var.app_name
  environment               = var.environment
  vpc_id                    = module.vpc.vpc_id
  public_subnet_ids         = module.vpc.public_subnet_ids
  alb_security_group_id     = module.security_groups.alb_security_group_id
  ecs_service_security_group_id = module.security_groups.ecs_service_security_group_id
  container_port            = var.container_port
}

# ECS Module
module "ecs" {
  source                    = "./ecs"
  name                      = var.app_name
  environment               = var.environment
  region                    = var.aws_region
  container_image           = "645406807036.dkr.ecr.ap-south-1.amazonaws.com/ecr_repo:latest"
  container_cpu             = var.container_cpu
  container_memory          = var.container_memory
  container_port            = var.container_port
  container_environment     = var.container_environment
  service_desired_count     = var.service_desired_count
  subnets                   = module.vpc.private_subnet_ids
  ecs_service_security_groups = [module.security_groups.ecs_service_security_group_id]
  aws_alb_target_group_arn  = module.alb.alb_target_group_arn
}


module "secrets" {
  source = "./secrets"
}

