terraform {
  required_version = ">= 1.0"

  /*
  * TODO: add any provider version constraints required by provider features
  * only available in later versions.
  */

  required_providers {
    aws = {
      version = ">=5.0.0, <6.0"
      source  = "hashicorp/aws"
    }
  }
}
