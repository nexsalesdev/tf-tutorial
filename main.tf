terraform {
  required_version = ">=0.15"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 3.60.0"
    }
  }
}

provider "google" {
  region = var.region
}
