terraform {
  required_providers {
    mongodbatlas = {
      source = "mongodb/mongodbatlas"
    }
  }
}

provider "mongodbatlas" {
  public_key  = var.mongodb_atlas_api_pub_key
  private_key = var.mongodb_atlas_api_pri_key
}

resource "mongodbatlas_project" "this" {
  name   = "fitrang"
  org_id = var.mongodb_atlas_org_id
}

resource "mongodbatlas_network_container" "this" {
  project_id        = mongodbatlas_project.this.id
  provider_name     = "GCP"
  atlas_cidr_block  = "10.100.0.0/18"
  region_name       = "ASIA_SOUTH_1"
}

resource "mongodbatlas_network_peering" "this" {
  project_id     = mongodbatlas_project.this.id
  container_id   = mongodbatlas_network_container.this.container_id
  provider_name  = "GCP"

  gcp_project_id = var.project_id
  network_name   = "fitrang-vpc"
}

resource "mongodbatlas_cluster" "this" {
  project_id   = mongodbatlas_project.this.id
  name         = "fitrang-cluster"

  provider_name               = "TENANT"
  backing_provider_name       = "GCP"
  provider_region_name        = "ASIA_SOUTH_1"
  provider_instance_size_name = "M2"
  mongo_db_major_version      = "6.0"

  auto_scaling_disk_gb_enabled = false
}

resource "mongodbatlas_database_user" "this" {
  project_id         = mongodbatlas_project.this.id
  username           = var.mongodb_atlas_database_username
  password           = var.mongodb_atlas_database_user_password
  auth_database_name = "admin"

  roles {
    role_name     = "atlasAdmin"
    database_name = "admin"
  }
}
