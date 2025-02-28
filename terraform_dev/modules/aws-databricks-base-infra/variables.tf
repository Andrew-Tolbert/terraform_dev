variable "databricks_account_id" {
  type        = string
  description = "(Required) Databricks Account ID"
}

variable "tags" {
  default = {}
}

variable "cidr_block" {
  default = "10.4.0.0/16"
}

variable "region" {
  default = "us-east-2"
}

variable "prefix" {
  default = "aht-demo"
}