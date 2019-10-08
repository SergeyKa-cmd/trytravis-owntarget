variable db_disk_image {
  description = "Disk image for reddit-db"
  default     = "reddit-db-base-1570252017"
}
variable "zone" {
  default = "europe-west1-b"
}
variable "public_key_path" {
  description = "~/.ssh/appuser.pub"
}
variable "private_key_path" {
  description = "~/.ssh/appuser"
}