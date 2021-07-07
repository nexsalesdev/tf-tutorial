terraform {
  backend "gcs" {
    bucket = "nx-tf-state-bucket"
    prefix = "app"
  }
}
