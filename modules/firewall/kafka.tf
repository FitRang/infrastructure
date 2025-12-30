resource "google_compute_firewall" "kafka_from_bastion" {
  name    = "kafka-from-bastion"
  network = var.network_id

  allow {
    protocol = "tcp"
    ports    = ["9092"]
  }

  source_tags = ["bastion"]
  target_tags = ["kafka"]
}
