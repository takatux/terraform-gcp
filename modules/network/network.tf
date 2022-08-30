resource "google_compute_network" "default" {
  project                     = var.project_id
  name                        = "${format("%s","${var.company}-${var.env}-vpc")}"
  auto_create_subnetworks     = false
  routing_mode                = "GLOBAL"
}