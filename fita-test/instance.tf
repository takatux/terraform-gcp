module "instance" {
  source          = "../modules/instance"
  instance_name   = "fita-instance"
  image           = "ubuntu-2004-focal-v20220823"
  tags            = var.tags
}