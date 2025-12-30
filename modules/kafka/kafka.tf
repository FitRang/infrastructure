resource "google_managed_kafka_cluster" "this" {
  project    = var.project_id
  location   = var.region
  cluster_id = var.kafka_cluster_id

  capacity_config {
    vcpu_count   = 3
    memory_bytes = 3221225472
  }

  gcp_config {
    access_config {
      network_configs {
        subnet = var.subnet_id
      }
    }
  }

  rebalance_config {
    mode = "AUTO_REBALANCE_ON_SCALE_UP"
  }

  labels = {
    env  = "dev"
    app  = "fitrang"
    role = "kafka"
  }
}
