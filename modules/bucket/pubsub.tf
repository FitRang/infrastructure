resource "google_pubsub_topic" "profile_uploads" {
  name = "${var.bucket_name}-profile-uploads"
}

data "google_project" "current" {}

resource "google_pubsub_topic_iam_member" "gcs_publisher" {
  topic  = google_pubsub_topic.profile_uploads.name
  role   = "roles/pubsub.publisher"
  member = "serviceAccount:service-${data.google_project.current.number}@gs-project-accounts.iam.gserviceaccount.com"
}
