output "network_id" {
  value = google_compute_network.this.id
}

output "subnet_id" {
  value = {
    app     = google_compute_subnetwork.app.id
    data    = google_compute_subnetwork.data.id
    control = google_compute_subnetwork.control.id
  }
}
