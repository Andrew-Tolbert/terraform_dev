output "databricks_workspace" {
  value = databricks_mws_workspaces.this.workspace_name
}

output "databricks_host" {
  value = databricks_mws_workspaces.this.workspace_url
}

output "databricks_workspace_id" {
  value = databricks_mws_workspaces.this.workspace_id
}

