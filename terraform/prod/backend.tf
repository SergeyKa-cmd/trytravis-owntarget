terraform {
  backend "gcs" {
    bucket = "nostromo-storage-bucket"
    prefix = "terraform/prod/terraform.tfstate"
  }
}