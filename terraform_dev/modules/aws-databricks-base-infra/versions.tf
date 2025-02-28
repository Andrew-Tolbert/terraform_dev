terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }

    databricks = {
      source                = "databricks/databricks"
      version               = ">=1.24.1"
      configuration_aliases = [databricks.mws]
    }
  }
}