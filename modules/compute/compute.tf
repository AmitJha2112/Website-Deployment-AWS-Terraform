variable "project_name" {}
variable "private_subnet_ids" { type = list(string) }
variable "instance_type" {}
variable "key_name" { default = null }
variable "website_repo" {}
variable "ec2_sg_id" {}
variable "alb_target_group_arn" {}
variable "tags" { type = map(string) }

data "aws_ami" "al2023" {
  most_recent = true
  owners      = ["137112412989"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}

data "aws_iam_policy_document" "ec2_assume" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "ec2_role" {
  name               = "${var.project_name}-ec2-role"
  assume_role_policy = data.aws_iam_policy_document.ec2_assume.json
}

resource "aws_iam_role_policy_attachment" "ssm" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "${var.project_name}-ec2-profile"
  role = aws_iam_role.ec2_role.name
}

locals {
  user_data = <<-EOF
    #!/bin/bash
    set -e
    dnf update -y || yum update -y || true
    dnf install -y git httpd || yum install -y git httpd
    systemctl enable httpd
    systemctl start httpd
    # deploy sample site
    if [ ! -d /var/www/html/.git ]; then
      rm -rf /var/www/html/*
      git clone ${var.website_repo} /opt/site || true
      if [ -d /opt/site ]; then
        cp -r /opt/site/* /var/www/html/ || true
      fi
      if [ ! -f /var/www/html/index.html ]; then
        echo "<h1>${var.project_name} - It works!</h1>" > /var/www/html/index.html
      fi
    fi
    systemctl restart httpd
  EOF
}

resource "aws_launch_template" "lt" {
  name_prefix   = "${var.project_name}-lt-"
  image_id      = data.aws_ami.al2023.id
  instance_type = var.instance_type
  key_name      = var.key_name
  vpc_security_group_ids = [var.ec2_sg_id]

  iam_instance_profile {
    name = aws_iam_instance_profile.ec2_profile.name
  }

  user_data = base64encode(local.user_data)

  tag_specifications {
    resource_type = "instance"
    tags = merge(var.tags, { Name = "${var.project_name}-ec2" })
  }
}

resource "aws_autoscaling_group" "asg" {
  name                      = "${var.project_name}-asg"
  desired_capacity          = 2
  min_size                  = 2
  max_size                  = 4
  health_check_type         = "ELB"
  vpc_zone_identifier       = var.private_subnet_ids
  target_group_arns         = [var.alb_target_group_arn]

  launch_template {
    id      = aws_launch_template.lt.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "${var.project_name}-ec2"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_policy" "scale_out" {
  name                   = "${var.project_name}-scaleout"
  autoscaling_group_name = aws_autoscaling_group.asg.name
  policy_type            = "TargetTrackingScaling"
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 50
  }
}

output "asg_name" {
  value = aws_autoscaling_group.asg.name
}

