variable app_disk_image {
  description = "Disk image for reddit-app"
  default     = "reddit-app-base-1570251754"
}
variable db_disk_image {
  description = "Disk image for reddit-db"
  default     = "reddit-db-base-1570252017"
}
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
variable "private_key_path" {
  description = "~/.ssh/appuser"
}
