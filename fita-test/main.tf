terraform {
  cloud {
    organization = "takatux"
    hostname = "app.terraform.io" # Optional; defaults to app.terraform.io

    workspaces {
      name = "terraform-gcp-fita"
    }
  }
}
