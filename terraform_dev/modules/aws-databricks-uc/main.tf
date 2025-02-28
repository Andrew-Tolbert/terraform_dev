#This module initializes a unity catalog with no default root location

resource "databricks_metastore" "this" {
  name          = local.metastore_name
  region        = var.region
  owner         = var.unity_metastore_owner
  force_destroy = true
}

# Sleeping for 20s to wait for the workspace to enable identity federation
resource "time_sleep" "wait_role_creation" {
  depends_on = [
    resource.databricks_metastore.this
  ]
  create_duration = "20s"
}

resource "databricks_metastore_assignment" "default_metastore" {
  count                = length(var.databricks_workspace_ids)
  workspace_id         = var.databricks_workspace_ids[count.index]
  metastore_id         = databricks_metastore.this.id
  default_catalog_name = "hive_metastore"
}