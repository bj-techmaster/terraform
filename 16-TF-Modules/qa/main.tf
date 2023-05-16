terraform {
  cloud {
    organization = "ORGNAME"

    workspaces {
      name = "qa_tf_resources_ws"
    }
  }
}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

module "infra_services" {
  source = "../modules/services/infra_services"
  cloud_env = "qa"
  vpc_tag_name = "qa_vpc"
  instance_count = "2"
  instance_type = "t4g.small"
  vpc_cidr = "172.31.0.0/16"
  public_cidr = "172.31.1.0/24"
  private_cidr = "172.31.2.0/24"
  bucket_name = "qa-terraform-s3-bucket-data"
  bucket_acl  = "private"
  instance_key_name = "aws-linux-mumbai"
}