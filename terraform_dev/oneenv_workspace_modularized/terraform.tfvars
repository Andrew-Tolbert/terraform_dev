region                      = "us-west-1"                                    // AWS region where you want to deploy your resources
cidr_block                  = "10.4.0.0/16"                                  // CIDR block for the workspace VPC, will be divided in two equal sized subnets
my_username                 = "andrew.tolbert@databricks.com"                          // Username for tagging the resources
databricks_account_id       = "0d26daa6-5e44-4c97-a497-ef015f91254a"                   // Databricks Account ID
databricks_client_id        = "fdfb83c5-1cb0-456b-a4c9-38d95ad2653a"             // Databricks Service Principal Client ID
databricks_client_secret    = "dosebe00df1d1d7a7c9a26297fe635e856cd"         // Databricks Service Principal Client Secret
aws_cli_profile             = "aht-sandbox-tf"

workspace_name              = "aht-oneenv-modularized"                      // Databricks Workspace Name - IF NOT PROVIDED or EMPTY it will defauly to a random "demo-<number>" prefix
metastore                   = "metastore_aws_us_west_1"
prefix                      = "aht-demo-modularized"

databricks_users            = ["andrew.tolbert@databricks.com","justin.kolpak@databricks.com","logan.rupert@databricks.com"]                                      // List of users that will be admins at the workspace level
databricks_metastore_admins = ["andrew.tolbert@databricks.com","justin.kolpak@databricks.com"]                        // List of users that will be admins for Unity Catalog
unity_admin_group           = "aht-tf"                                                                 // Metastore Owner and Admin


tags = {
  Environment = "Demo-with-terraform"
}