terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.6"
    }
  }
}

provider "aws" {
  region     = var.aws_region

  # 🔑 Direct credentials (Not recommended for production, but works)
  access_key = "xyz key"
  secret_key = "xyz key"
}
