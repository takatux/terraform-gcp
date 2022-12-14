resource "google_service_account" "default" {
  account_id   = "${format("%s","${var.instance_name}-sa")}"
  display_name = "Service Account"
}

resource "google_compute_instance" "default" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone

  tags = var.tags

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  // Local SSD disk
  #scratch_disk {
  #  interface = "SCSI"
  #}

  network_interface {
    subnetwork = "${format("%s","${var.company}-${var.env}-public-${var.region}")}"

    access_config {
      // Ephemeral public IP
    }
  }

  #metadata_startup_script = "echo hi > /test.txt"
  metadata_startup_script = var.metadata_startup_script

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.default.email
    scopes = ["cloud-platform"]
  }
}