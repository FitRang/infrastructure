resource "google_storage_notification" "profile_picture_uploads" {
  bucket         = google_storage_bucket.this.name
  topic          = google_pubsub_topic.profile_uploads.id
  payload_format = "JSON_API_V1"

  event_types = [
    "OBJECT_FINALIZE"
  ]
  object_name_prefix = "profile-pictures/"

  depends_on = [
    google_pubsub_topic_iam_member.gcs_publisher
  ]
}
