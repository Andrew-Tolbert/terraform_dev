# Step 1: Initializing authentication variables
variable "databricks_client_id" {
  type        = string
  description = "(Required) Client ID to authenticate the Databricks provider at the account level"
}

variable "databricks_client_secret" {
  type        = string
  description = "(Required) Client secret to authenticate the Databricks provider at the account level"
}

variable "databricks_account_id" {
  type        = string
  description = "(Required) Databricks Account ID"
}

variable "aws_cli_profile" {
  type        = string
  description = "(Required) aws clie profile"
}

# Step 2: Initializing configs and variables 
variable "tags" {
  type        = map(string)
  description = "(Optional) List of tags to be propagated accross all assets in this demo"
}
variable "cidr_block" {
  default = "10.4.0.0/16"
}

variable "region" {
  default = "us-east-2"
}

variable "prefix" {
  default = "aht-demo-modularized"
}

variable "workspace_name" {
  default = "aht-demo-modularized"
}

variable "roles_to_assume" {
  type        = list(string)
  description = "(Optional) List of AWS roles that the cross account role can pass to the clusters (important when creating instance profiles)"
  default     = []
}

variable "aws_access_services_role_name" {
  type        = string
  description = "(Optional) Name for the AWS Services role by this module"
  default     = null
}

# Step 3: Identity Access and Management 

variable "metastore"{
  type = string 
  description = "currently attached metastore, with UC by default one will always be created"
  default = ""
}

variable "my_username" {
  type        = string
  description = "(Required) Username in the form of an email to be added to the tags and be declared as owner of the assets"
}

variable "databricks_users" {
  description = <<EOT
  List of Databricks users to be added at account-level for Unity Catalog.
  Enter with square brackets and double quotes
  e.g ["first.last@domain.com", "second.last@domain.com"]
  EOT
  type        = list(string)
}

variable "databricks_metastore_admins" {
  description = <<EOT
  List of Admins to be added at account-level for Unity Catalog.
  Enter with square brackets and double quotes
  e.g ["first.admin@domain.com", "second.admin@domain.com"]
  EOT
  type        = list(string)
}

variable "unity_admin_group" {
  description = "(Required) Name of the admin group. This group will be set as the owner of the Unity Catalog metastore"
  type        = string
}
