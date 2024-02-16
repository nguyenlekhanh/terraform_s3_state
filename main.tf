terraform {
  # Run init/plan/apply with "backend" commented-out (ueses local backend) to provision Resources (Bucket, Table)
  # Then uncomment "backend" and run init, apply after Resources have been created (uses AWS)
#   backend "s3" {
#     bucket         = "cc-tf-state-backend-ci-cd-999"
#     key            = "tf-infra/terraform.tfstate"
#     region         = "us-east-1"
#     dynamodb_table = "terraform-state-locking"
#     encrypt        = true
#   }

  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region                   = "us-east-1"
}

module "tf-state" {
  source      = "./modules/tf-state"
  bucket_name = local.bucket_name
}
