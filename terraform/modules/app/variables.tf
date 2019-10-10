variable app_disk_image {
  description = "Disk image for reddit-app"
  default     = "reddit-app-base-1570251754"
}
variable zone {
  default = "europe-west1-b"
}
variable public_key_path {
  description = "~/.ssh/appuser.pub"
}
variable private_key_path {
  description = "~/.ssh/appuser"
}
variable db_url {
}