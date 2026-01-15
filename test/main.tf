
module "minimal" {
  source = "../"

  ami_id                  = ""
  private_subnet_ids      = []
  default_sg_id           = ""
  ecs_instance_profile_id = ""
  ecs_cluster_name        = ""
}

module "full" {
  source = "../"

  app_name                       = ""
  app_env                        = ""
  aws_access_key                 = ""
  aws_secret_key                 = ""
  ami_id                         = ""
  associate_public_ip_address    = false
  aws_instance                   = {}
  cpu_credits                    = ""
  root_device_name               = ""
  aws_region                     = ""
  private_subnet_ids             = []
  default_sg_id                  = ""
  ecs_instance_profile_id        = ""
  ecs_cluster_name               = ""
  key_name                       = ""
  additional_security_groups     = []
  additional_user_data           = ""
  tags                           = {}
  ebs_device                     = ""
  ebs_mount_point                = ""
  ebs_vol_id                     = ""
  ebs_mkfs_label                 = ""
  ebs_mkfs_labelflag             = ""
  ebs_mkfs_extraopts             = ""
  ebs_mountopts                  = ""
  ebs_fs_type                    = ""
  enable_ec2_detailed_monitoring = false
  enable_ipv6                    = false
}

output "launch_template_id" {
  value = module.minimal.launch_template_id
}

output "auto_scaling_group_id" {
  value = module.minimal.auto_scaling_group_id
}

provider "aws" {
  region = "us-east-1"
}

terraform {
  required_version = ">= 0.12"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0.0, < 6.0.0"
    }
  }
}
