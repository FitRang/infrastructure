resource "google_compute_instance" "bastion" {
  name         = var.vm_name
  project      = var.project_id
  zone         = var.zone
  machine_type = var.machine_type

  boot_disk {
    initialize_params {
      image = var.disk_image
      size  = var.disk_size_gb
    }
  }

  network_interface {
    network    = var.network_id
    subnetwork = var.subnet_id
    access_config {}
  }

  tags = var.tags
}
