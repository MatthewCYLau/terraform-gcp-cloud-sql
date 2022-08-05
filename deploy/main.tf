terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.31.0"
    }
  }
}

terraform {
  backend "gcs" {
    bucket = "cloud-sql-tf-state-001"
    prefix = "terraform/state"
  }
}

provider "google" {

  region  = var.region
  zone    = var.zone
  project = var.project
}

provider "google-beta" {

  region  = var.region
  zone    = var.zone
  project = var.project

}
