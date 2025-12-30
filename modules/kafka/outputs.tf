output "kafka_cluster_id" {
  value = google_managed_kafka_cluster.this.cluster_id
}

output "kafka_location" {
  value = google_managed_kafka_cluster.this.location
}
