##Create VM Instance for puma server
resource "google_compute_instance" "app" {
  # count        = var.count_instance
  name         = "reddit-app"
  machine_type = "f1-micro"
  zone         = var.zone
  boot_disk {
    initialize_params {
      image = var.app_disk_image
    }
  }
  tags = ["reddit-app"]

  network_interface {
    network = "default"
    access_config {
      nat_ip = google_compute_address.app_ip.address
    }
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
    source      = "${path.module}/scripts/puma.service"
    destination = "/tmp/puma.service"
  }

  provisioner "remote-exec" {
    script = "${path.module}/scripts/install_app.sh"
  }
  #Define mongodb server as source
  provisioner "remote-exec" {
    inline = ["echo export DATABASE_URL=\"${var.db_url}\" >> ~/.bash.profile"]
  }

}
#Assign static IP for App server
resource "google_compute_address" "app_ip" {
  name = "reddit-app-ip"
}
#Firewall rule for App server
resource "google_compute_firewall" "firewall_puma" {
  name    = "allow-puma-default"
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["9292"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["reddit-app"]
}