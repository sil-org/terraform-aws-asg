
/*
 * TODO: complete these basic instantiations of the module, with the base purpose of
 * validating the syntax of module code automatically when pushed to version control.
 * One instance should use the minimum allowable set of inputs. The other should have
 * the full complement of inputs. You may also wish to include module outputs to
 * enforce the presence of module outputs.
 */

module "minimal" {
  source = "../"

  variable_name = "foo"
}

module "full" {
  source = "../"

  variable_name = "foo"
}

output "an_output" {
  value = module.minimal.output_name
}

provider "aws" {
  region = "us-east-1"
}

terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
