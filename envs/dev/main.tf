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
  location = var.region
}

module "bastion_vm" {
  source      = "../../modules/vm"
  project_id  = var.project_id
  zone        = var.zone
  network_id  = module.vpc.network_id
  subnet_id   = module.vpc.subnet_id.control
  vm_name     = "fitrang-bastion"
}

module "kafka" {
  source = "../../modules/kafka"

  project_id        = var.project_id
  region            = var.region
  kafka_cluster_id  = "fitrang-kafka"
  subnet_id         = module.vpc.subnet_id.data
}

module "firewall" {
  source = "../../modules/firewall"

  project_id        = var.project_id
  network_id        = module.vpc.network_id
  ssh_source_ranges = ["49.37.171.195/32"]
}
