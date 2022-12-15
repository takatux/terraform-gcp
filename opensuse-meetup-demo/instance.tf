data "template_file" "user_data" {
  template = file("./cloud-init.yaml")
}

module "instance" {
  source          = "../modules/instance"
  instance_name   = "opensuse-instance"
  image           = "opensuse-leap-15-4-v20221201-x86-64"
  tags            = var.tags
  
}