module "network" {
  source     = "../modules/network"
  env        = var.env
  company    = var.company
  private_cidr_range = "10.0.0.0/24"
  public_cidr_range = "10.0.1.0/24"
}