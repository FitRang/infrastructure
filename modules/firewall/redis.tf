resource "google_compute_firewall" "redis_from_app" {

  name    = "redis-from-app"
  network = var.network_id

  allow {
    protocol = "tcp"
    ports    = ["6379"]
  }

  source_tags = ["bastion"]
  target_tags = ["redis"]
}
