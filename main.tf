# This file wires all modules together (VPC, Security, ALB, Compute, Monitoring, Database)

# Get all available Availability Zones in the selected region
data "aws_availability_zones" "available" {
  state = "available"
}

locals {
  # Use override AZs if provided, else pick first N AZs from available
  azs = length(var.azs_override) == var.az_count ? var.azs_override : slice(data.aws_availability_zones.available.names, 0, var.az_count)

  tags_common = {
    Project = var.project_name
    Managed = "terraform"
  }
}

# -------------------
# VPC Module
# -------------------
module "vpc" {
  source               = "./modules/vpc"
  project_name         = var.project_name
  vpc_cidr             = var.vpc_cidr
  azs                  = local.azs
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  tags                 = local.tags_common
}

# -------------------
# Security Groups
# -------------------
module "security" {
  source           = "./modules/security"
  project_name     = var.project_name
  vpc_id           = module.vpc.vpc_id
  allowed_ssh_cidr = var.allowed_ssh_cidr
  tags             = local.tags_common
}

# -------------------
# Application Load Balancer
# -------------------
module "alb" {
  source            = "./modules/alb"
  project_name      = var.project_name
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  alb_sg_id         = module.security.alb_sg_id
  target_port       = 80
  health_check_path = "/"
  tags              = local.tags_common
}

# -------------------
# Compute (EC2 + AutoScaling Group)
# -------------------
module "compute" {
  source               = "./modules/compute"
  project_name         = var.project_name
  private_subnet_ids   = module.vpc.private_subnet_ids
  instance_type        = var.instance_type
  key_name             = var.key_name
  website_repo         = var.website_repo
  ec2_sg_id            = module.security.ec2_sg_id
  alb_target_group_arn = module.alb.target_group_arn
  tags                 = local.tags_common
}


# -------------------
# Monitoring (CloudWatch + Alarms + SNS)
# -------------------
module "monitoring" {
  source       = "./modules/monitoring"
  project_name = var.project_name
  asg_name     = module.compute.asg_name
  sns_email    = var.sns_email
  aws_region   = var.aws_region   
  tags         = local.tags_common
}


# -------------------
# Database (RDS)
# -------------------
module "database" {
  source             = "./modules/database"
  project_name       = var.project_name
  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids
  db_engine          = var.db_engine
  db_engine_version  = var.db_engine_version
  db_instance_class  = var.db_instance_class
  db_name            = var.db_name
  db_username        = var.db_username
  db_password        = var.db_password
  db_sg_source_id    = module.security.ec2_sg_id
  tags               = local.tags_common
}

