resource "google_compute_network" "vpc_network" {
  project                     = var.project_id
  vpc_name                    = "${format("%s","${var.company}-${var.env}-vpc")}"
  auto_create_subnetworks     = false
  routing_mode                = "GLOBAL"
}