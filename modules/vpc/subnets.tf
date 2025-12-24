variable "vpc_name" {}
variable "region" {}
resource "google_compute_subnetwork" "app" {
  name          = "${var.vpc_name}-app-subnet"
  project       = var.project_id
  region        = var.region
  network       = google_compute_network.this.id
  ip_cidr_range = "10.0.1.0/24"
}

resource "google_compute_subnetwork" "data" {
  name          = "${var.vpc_name}-data-subnet"
  project       = var.project_id
  region        = var.region
  network       = google_compute_network.this.id
  ip_cidr_range = "10.0.2.0/24"
}

resource "google_compute_subnetwork" "control" {
  name          = "${var.vpc_name}-control-subnet"
  project       = var.project_id
  region        = var.region
  network       = google_compute_network.this.id
  ip_cidr_range = "10.0.3.0/24"
}
