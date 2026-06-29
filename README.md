# Terraform module for AWS Autoscaling Group

This module is used to create an autoscaling group launch template and an autoscaling group that uses the template.
An EBS file system can be mounted if needed.

## What this does

- Creates a launch template named after `app_name` and `app_env`.
- Creates an autoscaling group of defined size and distribute instances across `aws_zones`.
- Adds an EBS mount in the user-data script if required.

This module is published in [Terraform Registry](https://registry.terraform.io/modules/sil-org/asg/aws/latest).

## Usage Example

```hcl
module "this" {
  source  = "sil-org/asg/aws"
  version = ">= 0.1.0"

  app_name                = var.app_name
  app_env                 = var.app_env
  ami_id                  = module.ecs.ami_id
  aws_instance            = var.aws_instance
  aws_region              = var.aws_region
  private_subnet_ids      = [module.vpc.private_subnet_ids]
  default_sg_id           = module.vpc.vpc_default_sg_id
  ecs_instance_profile_id = module.ecs.ecs_instance_profile_id
  ecs_cluster_name        = module.ecs.ecs_cluster_name
  additional_user_data    = "yum install -y something-interesting"
  ebs_device              = "/dev/sdh"
  ebs_mount_point         = "/mnt/EBS"
  ebs_vol_id              = aws_ebs_volume.bigvol.id
  ebs_mkfs_label          = "MyBigFS"
  ebs_mkfs_extraopts      = "-m 2 -i 32768"

  tags = {
    foo = bar
  }
}

provider "aws" {
  region = "us-east-1"
}
```
