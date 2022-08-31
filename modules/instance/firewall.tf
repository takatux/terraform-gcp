resource "google_compute_firewall" "default-web-firewall" {
  name    = "default-web-firewall"
  network = var.network

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "443", "22"]
  }

  target_tags = var.tags
  source_ranges = "0.0.0.0/0"

}