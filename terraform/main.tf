terraform {
  # Terraform version info
  required_version = "~>0.12.8"
}
provider "google" {
  # Provider version info
  version = "2.15"

  #Project ID
  project = var.project

  region = var.region
}

resource "google_compute_instance" "app" {
  count        = var.count_instance
  name         = "reddit-app-${count.index}"
  machine_type = "g1-small"
  zone         = var.zone
  boot_disk {
    initialize_params {
      image = var.disk_image
    }
  }
  tags = ["reddit-app"]


  network_interface {
    network = "default"
    access_config {}
  }

  metadata = {
    # Public key path
    ssh-keys = "appuser:${file(var.public_key_path)}"
  }

  connection {
    type = "ssh"
    host  = self.network_interface[0].access_config[0].nat_ip
    user  = "appuser"
    agent = false
    # Private key path
    private_key = file(var.private_key_path)
  }

  provisioner "file" {
    source      = "files/puma.service"
    destination = "/tmp/puma.service"
  }

  provisioner "remote-exec" {
    script = "files/deploy.sh"
  }

}
#Firewall rule add to vm instance
resource "google_compute_firewall" "firewall_puma" {
  name = "allow-puma-default"
  # Network name firewall rule for
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["9292"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["reddit-app"]
}
#Attach multiple users to one SSH public key
resource "google_compute_project_metadata" "ssh_accounts" {
  metadata = {
    ssh-keys = <<EOF
  appuser1:${file(var.public_key_path)} appuser2:${file(var.public_key_path)} appuser_web:${file(var.public_key_path_tf)}
  EOF
  }
}