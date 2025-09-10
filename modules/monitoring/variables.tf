variable "project_name" {
  description = "Project name for tagging"
  type        = string
}

variable "asg_name" {
  description = "Auto Scaling Group name for CloudWatch monitoring"
  type        = string
}

variable "sns_email" {
  description = "Email address for CloudWatch SNS alerts"
  type        = string
}

variable "aws_region" {
  description = "AWS region for CloudWatch dashboard"
  type        = string
}

variable "tags" {
  description = "Common tags to apply"
  type        = map(string)
}
