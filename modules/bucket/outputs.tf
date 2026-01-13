output "bucket_name" {
  value = google_storage_bucket.this.name
}

output "profile_upload_topic" {
  value = google_pubsub_topic.profile_uploads.name
}
