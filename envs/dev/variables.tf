variable "project_id" {
  type = string
}

variable "region" {
  type    = string
  default = "asia-south1"
}

variable "zone" {
  description = "GCP zone to deploy resources"
  type        = string
  default     = "asia-south1-a"
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
