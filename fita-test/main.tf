terraform {
  cloud {
    organization = "takatux"
    hostname = "app.terraform.io" # Optional; defaults to app.terraform.io

    workspaces {
      name = "terraform-gcp-fita"
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
  project     = "lunar-geography-261201"
  region      = "asia-southeast1"
  zone        = "asia-southeast1-a"
}