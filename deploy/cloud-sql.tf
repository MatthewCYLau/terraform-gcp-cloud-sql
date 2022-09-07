resource "random_id" "db_name_suffix" {
  byte_length = 4
}

resource "google_sql_database_instance" "db_instance" {
  name   = "${var.project_name}-db-${random_id.db_name_suffix.hex}"
  region = var.region

  /*
  // private network settings
  depends_on = [google_service_networking_connection.private_vpc_connection]

  settings {
    tier              = "db-f1-micro"
    availability_type = "REGIONAL"
    user_labels = {
      "environment" : "production"
    }
    ip_configuration {
      ipv4_enabled    = false
      private_network = google_compute_network.vpc.id
    }
  }
  */

  // public network settings
  settings {
    tier              = "db-f1-micro"
    availability_type = "REGIONAL"
    user_labels = {
      "environment" : "production"
    }

    ip_configuration {
      ipv4_enabled = true
      authorized_networks {
        name  = "public"
        value = "0.0.0.0/0"
      }
    }

    database_flags {
      name  = "cloudsql.iam_authentication"
      value = "on"
    }
  }

  database_version    = "POSTGRES_13"
  deletion_protection = "false"
}

resource "google_sql_database" "db" {
  name     = "geese"
  instance = google_sql_database_instance.db_instance.id
}

data "google_secret_manager_secret_version" "postgresql_database_password" {
  provider = google-beta
  secret   = var.database_password_secret_name
}

resource "google_sql_user" "postgresql_database_user" {
  name     = "goose"
  instance = google_sql_database_instance.db_instance.id
  password = data.google_secret_manager_secret_version.postgresql_database_password.secret_data
}

resource "google_sql_user" "db_iam_user" {
  name     = split(".gserviceaccount.com", google_service_account.cloud_sql_instance_user.email)[0]
  instance = google_sql_database_instance.db_instance.id
  type     = "CLOUD_IAM_SERVICE_ACCOUNT"
}