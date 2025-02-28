data "aws_caller_identity" "current" {}

locals {
  prefix                        = "demo-${random_string.naming.result}"
  unity_admin_group             = "${var.prefix}-${var.unity_admin_group}"
  workspace_users_group         = "${var.prefix}-tf-workspace-users"
  tags                          = merge(var.tags, { Owner = split("@", var.my_username)[0], ownerEmail = var.my_username })
}


resource "random_string" "naming" {
  special = false
  upper   = false
  length  = 6
}