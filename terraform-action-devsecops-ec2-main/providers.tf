# Terraform Block
terraform {
  required_version = ">= 1.0" # which means any version equal & above 0.14 like 0.15, 0.16 etc and < 1.xx
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  backend "s3" {
    bucket  = "terraform-remote-state-ec2"
    key     = "dev/terraform-action-ec2/terraform.tfstate"
    region  = "us-east-1"
    profile = "sid-pixiebytez"
  }
}

provider "aws" {
  region = "us-east-1"
  # shared_credentials_files = ["/home/sid/.aws/credentials"]
  profile = "sid-pixiebytez"
}
