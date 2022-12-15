resource "google_compute_firewall" "default-web-firewall" {
  name    = "default-web-firewall"
  network = "${format("%s","${var.company}-${var.env}-vpc")}"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "443", "22", "3000"]
  }

  target_tags = var.tags
  source_ranges = [ "0.0.0.0/0" ] 

}