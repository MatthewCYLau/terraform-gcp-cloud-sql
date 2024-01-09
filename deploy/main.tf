terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
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
  project = var.project
}

