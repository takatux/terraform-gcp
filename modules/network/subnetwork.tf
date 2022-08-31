resource "google_compute_subnetwork" "private-subnet" {
  name          = "${format("%s","${var.company}-${var.env}-private-${var.region}")}"
  ip_cidr_range = var.private_cidr_range
  region        = var.region
  network       = google_compute_network.default.id
}

resource "google_compute_subnetwork" "public-subnet" {
  name          = "${format("%s","${var.company}-${var.env}-public-${var.region}")}"
  ip_cidr_range = var.public_cidr_range
  region        = var.region
  network       = google_compute_network.default.id
}