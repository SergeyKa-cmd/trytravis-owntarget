terraform {
  backend "gcs" {
    bucket = "concourse-terraform-remote-backend"
    prefix = "terraform-google-nat-gateway"
  }
}
