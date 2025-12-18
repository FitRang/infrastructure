variable "project_id" {}
variable "region" {}
variable "network_id" {}
variable "redis_name" {}

resource "google_redis_instance" "this" {
  name           = var.redis_name
  project        = var.project_id
  region         = var.region
  tier           = "BASIC"
  memory_size_gb = 1
  authorized_network = var.network_id
}

output "host" {
  value = google_redis_instance.this.host
}

output "port" {
  value = google_redis_instance.this.port
}
