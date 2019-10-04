variable "project" {
  description = "nostromo-253518"
}
variable "zone" {
  default = "europe-west1-b"
}
variable "region" {
  description = "Region"
  default     = "europe-west1"
}
variable "public_key_path" {
  description = "~/.ssh/appuser.pub"
}
variable "public_key_path_tf" {
  description = "~/.ssh/appuser_web.pub"
}
variable "disk_image" {
  description = "reddit-base-1569777902"
}
variable "private_key_path" {
  description = "~/.ssh/appuser"
}
variable "private_key_path_tf" {
  description = "~/.ssh/appuser_web"
}
variable "external_ip" {
  description = "google_compute_instance.app.network_interface[0].access_config[0].nat_ip"
}
variable "count_instance" {
  description = 3
}
