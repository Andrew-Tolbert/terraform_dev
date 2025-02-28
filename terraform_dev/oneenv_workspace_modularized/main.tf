//-------------------------------------SLEEP DEPENDS BELOW THIS LINE -------------------------------//

resource "time_sleep" "wait" {
  depends_on = [
    module.aws_base
  ]
  create_duration = "10s"
}


//-------------------------------------MODULES BELOW THIS LINE-------------------------------------//

module "aws_base" {
  providers = {
    databricks.mws = databricks.mws
  }
  source                = "../modules/aws-databricks-base-infra"
  prefix                = var.prefix
  region                = var.region
  databricks_account_id = var.databricks_account_id
  cidr_block            = var.cidr_block
  tags                  = var.tags
}


module "databricks_workspace" {
  providers = {
    databricks = databricks.mws
  }
  source                 = "../modules/aws-databricks-ws"
  prefix                 = var.prefix
  region                 = var.region
  databricks_account_id  = var.databricks_account_id
  cross_account_role_arn = module.aws_base.cross_account_role_arn
  security_group_ids     = module.aws_base.security_group_ids
  vpc_private_subnets    = module.aws_base.subnets
  vpc_id                 = module.aws_base.vpc_id
  root_storage_bucket    = module.aws_base.root_bucket
  workspace_name         = var.workspace_name
  deployment_name        = var.workspace_name
  tags                   = var.tags
  
  depends_on = [
    module.aws_base,
    time_sleep.wait
  ]

}

module "unity_catalog" {
  source                  = "../modules/aws-databricks-uc"
  providers = {
    databricks = databricks.mws
  }
  prefix                   = var.prefix
  region                   = var.region
  databricks_account_id    = var.databricks_account_id
  unity_metastore_owner    = databricks_group.admin_group.display_name
  databricks_workspace_ids = [module.databricks_workspace.databricks_workspace_id]
  tags                     = var.tags
}