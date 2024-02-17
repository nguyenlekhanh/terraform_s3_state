locals {
  tags = {
    Project     = var.project
    createdby   = var.createdby
    CreatedOn   = timestamp()
    Environment = var.environment
    TFWorkspace = terraform.workspace
  }
}

module "tf-state" {
  source      = "./modules/tf-state"
  bucket_name = var.backend_s3_bucket
  dynamodb_table_name = var.backend_dynamodb_table
}
