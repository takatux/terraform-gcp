resource "google_compute_firewall" "default-web-firewall" {
  name    = "default-web-firewall"
  network = google_compute_network.default.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "443", "22"]
  }

  target_tags = var.tags

}