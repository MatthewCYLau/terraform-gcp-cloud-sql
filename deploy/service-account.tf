resource "google_service_account" "cloud_sql_client" {
  account_id   = "cloud-sql-client"
  display_name = "Cloud SQL client service account"
}

resource "google_project_iam_member" "cloud_sql_client" {
  project = var.project
  role    = "roles/cloudsql.client"
  member  = "serviceAccount:${google_service_account.cloud_sql_client.email}"
}
