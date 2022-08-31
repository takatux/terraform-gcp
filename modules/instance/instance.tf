resource "google_service_account" "default" {
  account_id   = "${format("%s","${var.instance_name}-sa")}"
  display_name = "Service Account"
}

resource "google_compute_instance" "default" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone

  tags = var.tags

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  // Local SSD disk
  #scratch_disk {
  #  interface = "SCSI"
  #}

  network_interface {
    subnetwork = var.subnetwork

    access_config {
      // Ephemeral public IP
    }
  }

  metadata = {
    startup-script = <<SCRIPT
    #!/bin/sh

    set -o errexit
    set -o nounset

    IFS=$(printf '\n\t')

    # Docker
    sudo apt remove --yes docker docker-engine docker.io containerd runc || true
    sudo apt update
    sudo apt-get install --yes ca-certificates curl gnupg lsb-release
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt update
    sudo apt --yes --no-install-recommends install docker-ce docker-ce-cli containerd.io docker-compose-plugin
    sudo usermod --append --groups docker "$USER"
    sudo systemctl enable docker
    printf '\nDocker installed successfully\n\n'

    printf 'Waiting for Docker to start...\n\n'
    sleep 5

    # Docker Compose
    sudo wget --output-document=/usr/local/bin/docker-compose "https://github.com/docker/compose/releases/download/$(wget --quiet --output-document=- https://api.github.com/repos/docker/compose/releases/latest | grep --perl-regexp --only-matching '"tag_name": "\K.*?(?=")')/run.sh"
    sudo chmod +x /usr/local/bin/docker-compose
    sudo wget --output-document=/etc/bash_completion.d/docker-compose "https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/bash/docker-compose"
    printf '\nDocker Compose installed successfully\n\n'
    SCRIPT
  }

  #metadata_startup_script = "echo hi > /test.txt"

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.default.email
    scopes = ["cloud-platform"]
  }
}