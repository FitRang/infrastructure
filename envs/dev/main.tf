# dev/main.tf
provider "google" {
  project = var.project_id
  region  = var.region
}

module "vpc" {
  source     = "../../modules/vpc"
  project_id = var.project_id
  region     = var.region
  vpc_name   = "fitrang-vpc"
  subnet_cidr = "10.0.0.0/24"
}

module "redis" {
  source      = "../../modules/redis"
  project_id  = var.project_id
  region      = var.region
  network_id  = module.vpc.network_id
  redis_name  = "app-redis"
}

module "bucket" {
  source = "../../modules/bucket"
  bucket_name = "fitrang-dev-bucket"
}

module "bastion_vm" {
  source      = "../../modules/vm"
  project_id  = var.project_id
  zone        = var.zone
  network_id  = module.vpc.network_id
  subnet_id   = module.vpc.subnet_id
  vm_name     = "fitrang-bastion"
}
