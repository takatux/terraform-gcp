terraform {
  cloud {
    organization = "takatux"
    hostname = "app.terraform.io" # Optional; defaults to app.terraform.io

    workspaces {
      name = "terraform-gcp-demo"
    }
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0.0"
    }
  }
}

provider "google" {
  project     = var.project_id
  region      = var.region
  zone        = var.zone
}