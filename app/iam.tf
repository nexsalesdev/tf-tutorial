data "google_iam_policy" "noauth" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "noauth" {
  location = google_cloud_run_service.service.location
  service  = google_cloud_run_service.service.name
  project  = data.google_client_config.default.project

  policy_data = data.google_iam_policy.noauth.policy_data
}
