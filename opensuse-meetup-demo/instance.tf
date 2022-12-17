module "instance" {
  source          = "../modules/instance"
  instance_name   = "opensuse-instance"
  image           = "opensuse-leap-15-4-v20221201-x86-64"
  tags            = var.tags
  region          = var.region
  env             = var.env
  company         = var.company     
  metadata_startup_script = <<SCRIPT
    echo demo
    sudo zypper -n update
    sudo zypper install -y nginx
    sudo systemctl start nginx
    echo '<html> <head> <title>OpenSUSE ID</title> </head> <body> <h1>Welcome</h1> <p>This is a test server for static files.</p> <hr> <small>Powered by nginx and OpenSUSE Linux server</small> </body> </html>' | sudo tee /srv/www/htdocs/index.html
    SCRIPT
}