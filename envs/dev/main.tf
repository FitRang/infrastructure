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
  subnet_id   = module.vpc.subnet_id.control
  vm_name     = "fitrang-bastion"
}

module "firewall" {
  source = "../../modules/firewall"

  project_id        = var.project_id
  network_id        = module.vpc.network_id
  ssh_source_ranges = ["49.37.169.217/32"]
}
