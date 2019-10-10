terraform {
  backend "gcs" {
    bucket = "nostromo-storage-bucket"
    prefix = "terraform/stage/terraform.tfstate"
  }
}