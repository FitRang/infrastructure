#modules/mongodb/variables.tf
variable "project_id" {
  type        = string
  description = "GCP project ID used for Atlas VPC peering"
}

variable "mongodb_atlas_api_pub_key" {
  type      = string
  sensitive = true
}

variable "mongodb_atlas_api_pri_key" {
  type      = string
  sensitive = true
}

variable "mongodb_atlas_org_id" {
  type = string
}

variable "mongodb_atlas_database_username" {
  type = string
}

variable "mongodb_atlas_database_user_password" {
  type      = string
  sensitive = true
}
