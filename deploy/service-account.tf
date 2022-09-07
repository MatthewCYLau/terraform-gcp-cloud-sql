resource "google_service_account" "cloud_sql_client" {
  account_id   = "cloud-sql-client"
  display_name = "Cloud SQL client service account"
}

resource "google_project_iam_member" "cloud_sql_client" {
  project = var.project
  role    = "roles/cloudsql.client"
  member  = "serviceAccount:${google_service_account.cloud_sql_client.email}"
}

resource "google_service_account" "cloud_sql_instance_user" {
  account_id   = "db-iam-user"
  display_name = "db-iam-user"
}

resource "google_project_iam_member" "cloud_sql_instance_user" {
  project = var.project
  role    = "roles/cloudsql.instanceUser"
  member  = "serviceAccount:${google_service_account.cloud_sql_instance_user.email}"
}

resource "google_project_iam_member" "cloud_sql_instance_user_client" {
  project = var.project
  role    = "roles/cloudsql.client"
  member  = "serviceAccount:${google_service_account.cloud_sql_instance_user.email}"
}