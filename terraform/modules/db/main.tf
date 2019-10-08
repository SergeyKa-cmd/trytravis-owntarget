##Create VM Instance for mongodb server
resource "google_compute_instance" "db" {
  name         = "reddit-db"
  machine_type = "f1-micro"
  zone         = var.zone
  boot_disk {
    initialize_params {
      image = var.db_disk_image
    }
  }
  tags = ["reddit-db"]

  network_interface {
    network = "default"
    access_config {}
  }
 #Adding appuser credentials
  metadata = {
    ssh-keys = "appuser:${file(var.public_key_path)}"
  }

  connection {
    type        = "ssh"
    host        = self.network_interface[0].access_config[0].nat_ip
    user        = "appuser"
    agent       = false
    private_key = file(var.private_key_path)
  }
 #Service file delivery to instance
  provisioner "file" {
    source      = "${path.module}/scripts/mongod.conf"
    destination = "/tmp/mongod.conf"
  }

  provisioner "remote-exec" {
    script = "${path.module}/scripts/install_mongodb.sh"
  }
}
#Firewall rule for mongodb server
resource "google_compute_firewall" "firewall_mongo" {
  name    = "allow-mongo-default"
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["27017"]
  }
  source_tags = ["reddit-app"]
  target_tags = ["reddit-db"]
}