module "instance" {
  source          = "../modules/instance"
  instance_name   = "fita-test"
  image           = "debian-10-buster-v20220822"
  tags            = var.tags
}