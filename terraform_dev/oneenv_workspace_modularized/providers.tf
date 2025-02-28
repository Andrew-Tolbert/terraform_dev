terraform {
  backend "s3" {
    bucket                  = "aht-oneenv-tfstate"
    key                     = "aht-oneenv-workspace"
    region                  = "us-west-1"
    profile                 = "aht-sandbox-tf"
  }

  required_providers {
    databricks = {
      source = "databricks/databricks"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.15.0"
    }
  }
}

provider "aws" {
  region  = var.region
  profile = var.aws_cli_profile
}

// Initialize provider in multi workspace mode
provider "databricks" {
  alias         = "mws"
  host          = "https://accounts.cloud.databricks.com"
  account_id    = var.databricks_account_id
  client_id     = var.databricks_client_id
  client_secret = var.databricks_client_secret
}

# Initialize the provider for the workspace we created in this terraform

provider "databricks" {
  alias         = "workspace"
  host          = module.databricks_workspace.databricks_host
  client_id     = var.databricks_client_id
  client_secret = var.databricks_client_secret
}
